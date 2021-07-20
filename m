Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901FA3CF55F
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Jul 2021 09:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952C26E23D;
	Tue, 20 Jul 2021 07:35:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1856 seconds by postgrey-1.36 at gabe;
 Tue, 20 Jul 2021 07:21:32 UTC
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BB856E150
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Jul 2021 07:21:32 +0000 (UTC)
Received: from BJHW-Mail-Ex01.internal.baidu.com (unknown [10.127.64.11])
 by Forcepoint Email with ESMTPS id 969EAFD35FF82B9BC42D;
 Tue, 20 Jul 2021 14:34:42 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex01.internal.baidu.com (10.127.64.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 20 Jul 2021 14:34:42 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 20 Jul 2021 14:34:41 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH] drm/amdkfd: move PTR_ERR under IS_ERR() condition
Date: Tue, 20 Jul 2021 14:34:35 +0800
Message-ID: <20210720063435.373-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex14.internal.baidu.com (172.31.51.54) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Mailman-Approved-At: Tue, 20 Jul 2021 07:35:33 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Cai Huoqing <caihuoqing@baidu.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

no need to get error code when IS_ERR is false

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index e48acdd03c1a..710659b3c1f0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -72,16 +72,18 @@ int kfd_chardev_init(void)
                goto err_register_chrdev;

        kfd_class = class_create(THIS_MODULE, kfd_dev_name);
-       err = PTR_ERR(kfd_class);
-       if (IS_ERR(kfd_class))
+       if (IS_ERR(kfd_class)) {
+               err = PTR_ERR(kfd_class);
                goto err_class_create;
+       }

        kfd_device = device_create(kfd_class, NULL,
                                        MKDEV(kfd_char_dev_major, 0),
                                        NULL, kfd_dev_name);
-       err = PTR_ERR(kfd_device);
-       if (IS_ERR(kfd_device))
+       if (IS_ERR(kfd_device)) {
+               err = PTR_ERR(kfd_device);
                goto err_device_create;
+       }

        return 0;

--
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
