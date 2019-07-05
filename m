Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156E160BEA
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 21:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E156E52E;
	Fri,  5 Jul 2019 19:53:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720053.outbound.protection.outlook.com [40.107.72.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B7C6E52C
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 19:53:48 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1332.namprd12.prod.outlook.com (10.168.223.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 19:53:43 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2052.010; Fri, 5 Jul 2019
 19:53:43 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/amdgpu: Prepare for hmm_range_register API change
Thread-Topic: [PATCH 1/1] drm/amdgpu: Prepare for hmm_range_register API change
Thread-Index: AQHVM2rjE73LQcJwTk+mP7aMDFESfqa8b5vP
Date: Fri, 5 Jul 2019 19:53:43 +0000
Message-ID: <BN6PR12MB1809605217F081F91DFF53CEF7F50@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190705195010.7569-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190705195010.7569-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.77.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82e3980c-1238-449b-2d15-08d701827c3c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1332; 
x-ms-traffictypediagnostic: BN6PR12MB1332:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1332EA41E6DF8A4C87C1E0CDF7F50@BN6PR12MB1332.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:235;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(189003)(199004)(6506007)(76176011)(53546011)(102836004)(316002)(110136005)(99286004)(53936002)(6246003)(2501003)(7696005)(105004)(52536014)(66066001)(5660300002)(71190400001)(71200400001)(2906002)(26005)(256004)(64756008)(66476007)(66946007)(66556008)(66446008)(73956011)(76116006)(14444005)(606006)(19627405001)(14454004)(186003)(72206003)(229853002)(966005)(6116002)(3846002)(9686003)(33656002)(4326008)(81156014)(446003)(236005)(81166006)(11346002)(55016002)(74316002)(7736002)(86362001)(54896002)(6436002)(486006)(478600001)(6306002)(68736007)(476003)(8936002)(25786009)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1332;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GpTzJCFl0tTPlbwSmHntcLqAoNKU99wwm+OfByTLvNNScdLJRqbkWn9J6yQaBtiQQeG024G7uadRpLGU/jEQs+4ZeXbi018gzHFXw7eLIsr5cLdTKGBW0NlLQt550Mvyxz+PHsFnwwhMdt2soHMGkDOSF+ZsDCOdZxAo8Sc99eOGMr5MxoVDRuDjYMQuxzGXeDeebraAuXJXClVoqYnPzSo5ZMjo7OI4Jqt1+aoxxBtqOniEnJt0l59FA8bioGuZ6lejwltUHSRt1wYrogM6eClQK19yVa3atR3yIkErU+c6Gy+E9eiCL6WNjoAwABNq3TyAIM0Wj3ldUDBNsWsN6JJOQVILRHXmun8+CEBRwXfH7nC1IlqoiRCKSxdOUNDt2OF5FQM4rgDtx9aP+oU4D9MiU9ShIojwlRhOOvlWUWk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e3980c-1238-449b-2d15-08d701827c3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 19:53:43.5630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1332
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRFhIkAQTNi9TrqzHUP3QqNb8PCiaBEnwokCdwOgcjc=;
 b=TeQerttfCJ6SxvuzTH9kaJnh278W733V38FZFSZzDujTXoqcWB9vSCSMjO9VYIyIV8Wz87qMA9enqOBE9GdoYfACRAQzbeTDBaItjSW2lJRWycswKLjZXn8cFCRU95aIvDQS0mYanziw/rqFO3kGd7vPj5rI1+i8y6hlDwMwjBI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Yang, Philip" <Philip.Yang@amd.com>
Content-Type: multipart/mixed; boundary="===============0502774972=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0502774972==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809605217F081F91DFF53CEF7F50BN6PR12MB1809namp_"

--_000_BN6PR12MB1809605217F081F91DFF53CEF7F50BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Kuehling=
, Felix <Felix.Kuehling@amd.com>
Sent: Friday, July 5, 2019 3:50 PM
To: amd-gfx@lists.freedesktop.org
Cc: Yang, Philip; Kuehling, Felix
Subject: [PATCH 1/1] drm/amdgpu: Prepare for hmm_range_register API change

From: Philip Yang <Philip.Yang@amd.com>

An upcoming change in the hmm_range_register API requires passing in
a pointer to an hmm_mirror instead of mm_struct. To access the
hmm_mirror we need pass bo instead of ttm to amdgpu_ttm_tt_get_user_pages
because mirror is part of amdgpu_mn structure, which is accessible from bo.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  5 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        | 37 ----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        | 44 ++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 10 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 ++-
 7 files changed, 55 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 58cecfe57f8b..f5ecf28eb37c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -503,7 +503,7 @@ static int init_user_pages(struct kgd_mem *mem, struct =
mm_struct *mm,
                 goto out;
         }

-       ret =3D amdgpu_ttm_tt_get_user_pages(bo->tbo.ttm, bo->tbo.ttm->page=
s);
+       ret =3D amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages);
         if (ret) {
                 pr_err("%s: Failed to get user pages: %d\n", __func__, ret=
);
                 goto unregister_out;
@@ -1728,8 +1728,7 @@ static int update_invalid_user_pages(struct amdkfd_pr=
ocess_info *process_info,
                 bo =3D mem->bo;

                 /* Get updated user pages */
-               ret =3D amdgpu_ttm_tt_get_user_pages(bo->tbo.ttm,
-                                                  bo->tbo.ttm->pages);
+               ret =3D amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages=
);
                 if (ret) {
                         pr_debug("%s: Failed to get user pages: %d\n",
                                 __func__, ret);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_cs.c
index c25e1ebc76c3..c691df6f7a57 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -631,7 +631,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser=
 *p,
                         return -ENOMEM;
                 }

-               r =3D amdgpu_ttm_tt_get_user_pages(bo->tbo.ttm, e->user_pag=
es);
+               r =3D amdgpu_ttm_tt_get_user_pages(bo, e->user_pages);
                 if (r) {
                         kvfree(e->user_pages);
                         e->user_pages =3D NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_gem.c
index ed25a4e14404..2cead5a242d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -323,8 +323,7 @@ int amdgpu_gem_userptr_ioctl(struct drm_device *dev, vo=
id *data,
         }

         if (args->flags & AMDGPU_GEM_USERPTR_VALIDATE) {
-               r =3D amdgpu_ttm_tt_get_user_pages(bo->tbo.ttm,
-                                                bo->tbo.ttm->pages);
+               r =3D amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages);
                 if (r)
                         goto release_object;

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_mn.c
index e0bb47ce570b..3971c201f320 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
@@ -45,48 +45,11 @@

 #include <linux/firmware.h>
 #include <linux/module.h>
-#include <linux/hmm.h>
-#include <linux/interval_tree.h>
-#include <drm/drmP.h>
 #include <drm/drm.h>

 #include "amdgpu.h"
 #include "amdgpu_amdkfd.h"

-/**
- * struct amdgpu_mn
- *
- * @adev: amdgpu device pointer
- * @mm: process address space
- * @type: type of MMU notifier
- * @work: destruction work item
- * @node: hash table node to find structure by adev and mn
- * @lock: rw semaphore protecting the notifier nodes
- * @objects: interval tree containing amdgpu_mn_nodes
- * @mirror: HMM mirror function support
- *
- * Data for each amdgpu device and process address space.
- */
-struct amdgpu_mn {
-       /* constant after initialisation */
-       struct amdgpu_device    *adev;
-       struct mm_struct        *mm;
-       enum amdgpu_mn_type     type;
-
-       /* only used on destruction */
-       struct work_struct      work;
-
-       /* protected by adev->mn_lock */
-       struct hlist_node       node;
-
-       /* objects protected by lock */
-       struct rw_semaphore     lock;
-       struct rb_root_cached   objects;
-
-       /* HMM mirror */
-       struct hmm_mirror       mirror;
-};
-
 /**
  * struct amdgpu_mn_node
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_mn.h
index f5b67c63ed6b..281fd9fef662 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
@@ -24,17 +24,51 @@
 #ifndef __AMDGPU_MN_H__
 #define __AMDGPU_MN_H__

-/*
- * HMM mirror
- */
-struct amdgpu_mn;
-struct hmm_range;
+#include <linux/types.h>
+#include <linux/hmm.h>
+#include <linux/rwsem.h>
+#include <linux/workqueue.h>
+#include <linux/interval_tree.h>

 enum amdgpu_mn_type {
         AMDGPU_MN_TYPE_GFX,
         AMDGPU_MN_TYPE_HSA,
 };

+/**
+ * struct amdgpu_mn
+ *
+ * @adev: amdgpu device pointer
+ * @mm: process address space
+ * @type: type of MMU notifier
+ * @work: destruction work item
+ * @node: hash table node to find structure by adev and mn
+ * @lock: rw semaphore protecting the notifier nodes
+ * @objects: interval tree containing amdgpu_mn_nodes
+ * @mirror: HMM mirror function support
+ *
+ * Data for each amdgpu device and process address space.
+ */
+struct amdgpu_mn {
+       /* constant after initialisation */
+       struct amdgpu_device    *adev;
+       struct mm_struct        *mm;
+       enum amdgpu_mn_type     type;
+
+       /* only used on destruction */
+       struct work_struct      work;
+
+       /* protected by adev->mn_lock */
+       struct hlist_node       node;
+
+       /* objects protected by lock */
+       struct rw_semaphore     lock;
+       struct rb_root_cached   objects;
+
+       /* HMM mirror */
+       struct hmm_mirror       mirror;
+};
+
 #if defined(CONFIG_HMM_MIRROR)
 void amdgpu_mn_lock(struct amdgpu_mn *mn);
 void amdgpu_mn_unlock(struct amdgpu_mn *mn);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.c
index 8225d6e05a55..5d85617886b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -726,8 +726,10 @@ struct amdgpu_ttm_tt {

 #define MAX_RETRY_HMM_RANGE_FAULT       16

-int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, struct page **pages)
+int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages=
)
 {
+       struct hmm_mirror *mirror =3D bo->mn ? &bo->mn->mirror : NULL;
+       struct ttm_tt *ttm =3D bo->tbo.ttm;
         struct amdgpu_ttm_tt *gtt =3D (void *)ttm;
         struct mm_struct *mm =3D gtt->usertask->mm;
         unsigned long start =3D gtt->userptr;
@@ -741,6 +743,12 @@ int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, s=
truct page **pages)
         if (!mm) /* Happens during process shutdown */
                 return -ESRCH;

+       if (unlikely(!mirror)) {
+               DRM_DEBUG_DRIVER("Failed to get hmm_mirror\n");
+               r =3D -EFAULT;
+               goto out;
+       }
+
         vma =3D find_vma(mm, start);
         if (unlikely(!vma || start < vma->vm_start)) {
                 r =3D -EFAULT;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.h
index c2b7669004ba..caa76c693700 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -102,10 +102,11 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *b=
o);
 int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);

 #if IS_ENABLED(CONFIG_DRM_AMDGPU_USERPTR)
-int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, struct page **pages);
+int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages=
);
 bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm);
 #else
-static inline int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, struct =
page **pages)
+static inline int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo,
+                                              struct page **pages)
 {
         return -EPERM;
 }
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809605217F081F91DFF53CEF7F50BN6PR12MB1809namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Kuehling, Felix &lt;Felix.Kue=
hling@amd.com&gt;<br>
<b>Sent:</b> Friday, July 5, 2019 3:50 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Yang, Philip; Kuehling, Felix<br>
<b>Subject:</b> [PATCH 1/1] drm/amdgpu: Prepare for hmm_range_register API =
change</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Philip Yang &lt;Philip.Yang@amd.com&gt;<br>
<br>
An upcoming change in the hmm_range_register API requires passing in<br>
a pointer to an hmm_mirror instead of mm_struct. To access the<br>
hmm_mirror we need pass bo instead of ttm to amdgpu_ttm_tt_get_user_pages<b=
r>
because mirror is part of amdgpu_mn structure, which is accessible from bo.=
<br>
<br>
Signed-off-by: Philip Yang &lt;Philip.Yang@amd.com&gt;<br>
Signed-off-by: Felix Kuehling &lt;Felix.Kuehling@amd.com&gt;<br>
---<br>
&nbsp;.../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c&nbsp; |&nbsp; 5 &#43;--<=
br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 2 &#43;-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 3 &#43;-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 37 ----------------<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 44 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 10 &#43;&#43;&#43;&#43;-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 5 &#43;&#43;-<br>
&nbsp;7 files changed, 55 insertions(&#43;), 51 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
index 58cecfe57f8b..f5ecf28eb37c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
@@ -503,7 &#43;503,7 @@ static int init_user_pages(struct kgd_mem *mem, str=
uct mm_struct *mm,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto out;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_ttm_tt_get_user_pages(=
bo-&gt;tbo.ttm, bo-&gt;tbo.ttm-&gt;pages);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_ttm_tt_get_user_pa=
ges(bo, bo-&gt;tbo.ttm-&gt;pages);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pr_err(&quot;%s: Failed to get user pages: %d\n&quot;=
, __func__, ret);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto unregister_out;<br>
@@ -1728,8 &#43;1728,7 @@ static int update_invalid_user_pages(struct amdkf=
d_process_info *process_info,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bo =3D mem-&gt;bo;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* Get updated user pages */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D amdgpu_ttm_tt_get_user_pages(bo-&gt;tbo.ttm,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&=
gt;tbo.ttm-&gt;pages);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D amdgpu_ttm_tt_get_user_pages(bo, bo-&gt;tbo.ttm-&gt;=
pages);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_de=
bug(&quot;%s: Failed to get user pages: %d\n&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __func__, ret);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_cs.c<br>
index c25e1ebc76c3..c691df6f7a57 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
@@ -631,7 &#43;631,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_pa=
rser *p,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n -ENOMEM;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; r =3D amdgpu_ttm_tt_get_user_pages(bo-&gt;tbo.ttm, e-&gt;user_pa=
ges);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; r =3D amdgpu_ttm_tt_get_user_pages(bo, e-&gt;user_pages);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (r) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kvfre=
e(e-&gt;user_pages);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e-&gt=
;user_pages =3D NULL;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_gem.c<br>
index ed25a4e14404..2cead5a242d7 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
@@ -323,8 &#43;323,7 @@ int amdgpu_gem_userptr_ioctl(struct drm_device *dev=
, void *data,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (args-&gt;flags &amp; A=
MDGPU_GEM_USERPTR_VALIDATE) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; r =3D amdgpu_ttm_tt_get_user_pages(bo-&gt;tbo.ttm,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;tbo.ttm-&=
gt;pages);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; r =3D amdgpu_ttm_tt_get_user_pages(bo, bo-&gt;tbo.ttm-&gt;pa=
ges);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (r)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto =
release_object;<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_mn.c<br>
index e0bb47ce570b..3971c201f320 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c<br>
@@ -45,48 &#43;45,11 @@<br>
&nbsp;<br>
&nbsp;#include &lt;linux/firmware.h&gt;<br>
&nbsp;#include &lt;linux/module.h&gt;<br>
-#include &lt;linux/hmm.h&gt;<br>
-#include &lt;linux/interval_tree.h&gt;<br>
-#include &lt;drm/drmP.h&gt;<br>
&nbsp;#include &lt;drm/drm.h&gt;<br>
&nbsp;<br>
&nbsp;#include &quot;amdgpu.h&quot;<br>
&nbsp;#include &quot;amdgpu_amdkfd.h&quot;<br>
&nbsp;<br>
-/**<br>
- * struct amdgpu_mn<br>
- *<br>
- * @adev: amdgpu device pointer<br>
- * @mm: process address space<br>
- * @type: type of MMU notifier<br>
- * @work: destruction work item<br>
- * @node: hash table node to find structure by adev and mn<br>
- * @lock: rw semaphore protecting the notifier nodes<br>
- * @objects: interval tree containing amdgpu_mn_nodes<br>
- * @mirror: HMM mirror function support<br>
- *<br>
- * Data for each amdgpu device and process address space.<br>
- */<br>
-struct amdgpu_mn {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* constant after initialisation */<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device&nbsp;&nbsp;&nbsp=
; *adev;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mm_struct&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *mm;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amdgpu_mn_type&nbsp;&nbsp;&nbsp;=
&nbsp; type;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* only used on destruction */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct work_struct&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; work;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* protected by adev-&gt;mn_lock */<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hlist_node&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; node;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* objects protected by lock */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct rw_semaphore&nbsp;&nbsp;&nbsp;=
&nbsp; lock;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct rb_root_cached&nbsp;&nbsp; obj=
ects;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* HMM mirror */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hmm_mirror&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; mirror;<br>
-};<br>
-<br>
&nbsp;/**<br>
&nbsp; * struct amdgpu_mn_node<br>
&nbsp; *<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_mn.h<br>
index f5b67c63ed6b..281fd9fef662 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h<br>
@@ -24,17 &#43;24,51 @@<br>
&nbsp;#ifndef __AMDGPU_MN_H__<br>
&nbsp;#define __AMDGPU_MN_H__<br>
&nbsp;<br>
-/*<br>
- * HMM mirror<br>
- */<br>
-struct amdgpu_mn;<br>
-struct hmm_range;<br>
&#43;#include &lt;linux/types.h&gt;<br>
&#43;#include &lt;linux/hmm.h&gt;<br>
&#43;#include &lt;linux/rwsem.h&gt;<br>
&#43;#include &lt;linux/workqueue.h&gt;<br>
&#43;#include &lt;linux/interval_tree.h&gt;<br>
&nbsp;<br>
&nbsp;enum amdgpu_mn_type {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_MN_TYPE_GFX,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_MN_TYPE_HSA,<br>
&nbsp;};<br>
&nbsp;<br>
&#43;/**<br>
&#43; * struct amdgpu_mn<br>
&#43; *<br>
&#43; * @adev: amdgpu device pointer<br>
&#43; * @mm: process address space<br>
&#43; * @type: type of MMU notifier<br>
&#43; * @work: destruction work item<br>
&#43; * @node: hash table node to find structure by adev and mn<br>
&#43; * @lock: rw semaphore protecting the notifier nodes<br>
&#43; * @objects: interval tree containing amdgpu_mn_nodes<br>
&#43; * @mirror: HMM mirror function support<br>
&#43; *<br>
&#43; * Data for each amdgpu device and process address space.<br>
&#43; */<br>
&#43;struct amdgpu_mn {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* constant after initialisation =
*/<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device&nbsp;&nbsp;&=
nbsp; *adev;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mm_struct&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *mm;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amdgpu_mn_type&nbsp;&nbsp;&n=
bsp;&nbsp; type;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* only used on destruction */<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct work_struct&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; work;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* protected by adev-&gt;mn_lock =
*/<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hlist_node&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; node;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* objects protected by lock */<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct rw_semaphore&nbsp;&nbsp;&n=
bsp;&nbsp; lock;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct rb_root_cached&nbsp;&nbsp;=
 objects;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* HMM mirror */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hmm_mirror&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; mirror;<br>
&#43;};<br>
&#43;<br>
&nbsp;#if defined(CONFIG_HMM_MIRROR)<br>
&nbsp;void amdgpu_mn_lock(struct amdgpu_mn *mn);<br>
&nbsp;void amdgpu_mn_unlock(struct amdgpu_mn *mn);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.c<br>
index 8225d6e05a55..5d85617886b3 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
@@ -726,8 &#43;726,10 @@ struct amdgpu_ttm_tt {<br>
&nbsp;<br>
&nbsp;#define MAX_RETRY_HMM_RANGE_FAULT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 16<br>
&nbsp;<br>
-int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, struct page **pages)<=
br>
&#43;int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **p=
ages)<br>
&nbsp;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hmm_mirror *mirror =3D bo-=
&gt;mn ? &amp;bo-&gt;mn-&gt;mirror : NULL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_tt *ttm =3D bo-&gt;tbo=
.ttm;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ttm_tt *gtt =
=3D (void *)ttm;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mm_struct *mm =3D g=
tt-&gt;usertask-&gt;mm;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long start =3D gt=
t-&gt;userptr;<br>
@@ -741,6 &#43;743,12 @@ int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *tt=
m, struct page **pages)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!mm) /* Happens during=
 process shutdown */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -ESRCH;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(!mirror)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; DRM_DEBUG_DRIVER(&quot;Failed to get hmm_mirror\n&quot;);<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; r =3D -EFAULT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; goto out;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma =3D find_vma(mm, start=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(!vma || start=
 &lt; vma-&gt;vm_start)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; r =3D -EFAULT;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.h<br>
index c2b7669004ba..caa76c693700 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h<br>
@@ -102,10 &#43;102,11 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_objec=
t *bo);<br>
&nbsp;int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);<br>
&nbsp;<br>
&nbsp;#if IS_ENABLED(CONFIG_DRM_AMDGPU_USERPTR)<br>
-int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, struct page **pages);=
<br>
&#43;int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **p=
ages);<br>
&nbsp;bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm);<br>
&nbsp;#else<br>
-static inline int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, struct =
page **pages)<br>
&#43;static inline int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo,<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct page **pages)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EPERM;<br>
&nbsp;}<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809605217F081F91DFF53CEF7F50BN6PR12MB1809namp_--

--===============0502774972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0502774972==--
