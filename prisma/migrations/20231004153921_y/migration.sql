/*
  Warnings:

  - You are about to drop the column `categoryImg` on the `categories` table. All the data in the column will be lost.
  - You are about to drop the column `categoryName` on the `categories` table. All the data in the column will be lost.
  - You are about to drop the column `cus_details` on the `invoices` table. All the data in the column will be lost.
  - You are about to drop the column `delivery_status` on the `invoices` table. All the data in the column will be lost.
  - You are about to drop the column `payment_status` on the `invoices` table. All the data in the column will be lost.
  - You are about to drop the column `ship_details` on the `invoices` table. All the data in the column will be lost.
  - You are about to drop the column `tran_id` on the `invoices` table. All the data in the column will be lost.
  - You are about to drop the column `val_id` on the `invoices` table. All the data in the column will be lost.
  - You are about to drop the column `brand_id` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `discount` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `discount_price` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `image` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `remark` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `short_des` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `star` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `stock` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `products` table. All the data in the column will be lost.
  - You are about to drop the `brands` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `customer_profiles` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `migrations` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `personal_access_tokens` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `policies` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_carts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_details` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_reviews` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_sliders` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_wishes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `sslcommerz_accounts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[product_id]` on the table `invoice_products` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `name` to the `categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `category_id` to the `invoices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `discount` to the `invoices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `img_url` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `unit` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `customer_profiles` DROP FOREIGN KEY `customer_profiles_user_id_foreign`;

-- DropForeignKey
ALTER TABLE `invoice_products` DROP FOREIGN KEY `invoice_products_invoice_id_foreign`;

-- DropForeignKey
ALTER TABLE `invoice_products` DROP FOREIGN KEY `invoice_products_product_id_foreign`;

-- DropForeignKey
ALTER TABLE `invoice_products` DROP FOREIGN KEY `invoice_products_user_id_foreign`;

-- DropForeignKey
ALTER TABLE `invoices` DROP FOREIGN KEY `invoices_user_id_foreign`;

-- DropForeignKey
ALTER TABLE `product_carts` DROP FOREIGN KEY `product_carts_product_id_foreign`;

-- DropForeignKey
ALTER TABLE `product_carts` DROP FOREIGN KEY `product_carts_user_id_foreign`;

-- DropForeignKey
ALTER TABLE `product_details` DROP FOREIGN KEY `product_details_product_id_foreign`;

-- DropForeignKey
ALTER TABLE `product_reviews` DROP FOREIGN KEY `product_reviews_customer_id_foreign`;

-- DropForeignKey
ALTER TABLE `product_reviews` DROP FOREIGN KEY `product_reviews_product_id_foreign`;

-- DropForeignKey
ALTER TABLE `product_sliders` DROP FOREIGN KEY `product_sliders_product_id_foreign`;

-- DropForeignKey
ALTER TABLE `product_wishes` DROP FOREIGN KEY `product_wishes_product_id_foreign`;

-- DropForeignKey
ALTER TABLE `product_wishes` DROP FOREIGN KEY `product_wishes_user_id_foreign`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_brand_id_foreign`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_category_id_foreign`;

-- AlterTable
ALTER TABLE `categories` DROP COLUMN `categoryImg`,
    DROP COLUMN `categoryName`,
    ADD COLUMN `name` VARCHAR(191) NOT NULL,
    ADD COLUMN `user_id` BIGINT UNSIGNED NOT NULL;

-- AlterTable
ALTER TABLE `invoice_products` MODIFY `qty` VARCHAR(191) NOT NULL,
    MODIFY `sale_price` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `invoices` DROP COLUMN `cus_details`,
    DROP COLUMN `delivery_status`,
    DROP COLUMN `payment_status`,
    DROP COLUMN `ship_details`,
    DROP COLUMN `tran_id`,
    DROP COLUMN `val_id`,
    ADD COLUMN `category_id` BIGINT UNSIGNED NOT NULL,
    ADD COLUMN `discount` VARCHAR(191) NOT NULL,
    MODIFY `total` VARCHAR(191) NOT NULL,
    MODIFY `vat` VARCHAR(191) NOT NULL,
    MODIFY `payable` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `products` DROP COLUMN `brand_id`,
    DROP COLUMN `discount`,
    DROP COLUMN `discount_price`,
    DROP COLUMN `image`,
    DROP COLUMN `remark`,
    DROP COLUMN `short_des`,
    DROP COLUMN `star`,
    DROP COLUMN `stock`,
    DROP COLUMN `title`,
    ADD COLUMN `img_url` VARCHAR(191) NOT NULL,
    ADD COLUMN `name` VARCHAR(191) NOT NULL,
    ADD COLUMN `unit` VARCHAR(191) NOT NULL,
    ADD COLUMN `user_id` BIGINT UNSIGNED NOT NULL,
    MODIFY `price` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `brands`;

-- DropTable
DROP TABLE `customer_profiles`;

-- DropTable
DROP TABLE `migrations`;

-- DropTable
DROP TABLE `personal_access_tokens`;

-- DropTable
DROP TABLE `policies`;

-- DropTable
DROP TABLE `product_carts`;

-- DropTable
DROP TABLE `product_details`;

-- DropTable
DROP TABLE `product_reviews`;

-- DropTable
DROP TABLE `product_sliders`;

-- DropTable
DROP TABLE `product_wishes`;

-- DropTable
DROP TABLE `sslcommerz_accounts`;

-- DropTable
DROP TABLE `users`;

-- CreateTable
CREATE TABLE `user` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `mobile` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `otp` VARCHAR(191) NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `user_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customers` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `mobile` VARCHAR(191) NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `invoice_products_product_id_key` ON `invoice_products`(`product_id`);

-- AddForeignKey
ALTER TABLE `categories` ADD CONSTRAINT `categories_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customers` ADD CONSTRAINT `customers_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice_products` ADD CONSTRAINT `invoice_products_invoice_id_fkey` FOREIGN KEY (`invoice_id`) REFERENCES `invoices`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice_products` ADD CONSTRAINT `invoice_products_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice_products` ADD CONSTRAINT `invoice_products_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
