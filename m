Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4811D0A9F
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2020 10:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358E76E141;
	Wed, 13 May 2020 08:16:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760078.outbound.protection.outlook.com [40.107.76.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E38B6E9AC
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 May 2020 08:16:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iP3pVOaugsxmJPhaghszQZxdA0V2vGFwqEWl3aYbkn+LwKdZm2qkq9/NQT2UNh5Gldccl4lw9oG7CJQwKhIqLkCWxfvUyGqEhA59SWeX7PKekRvr5739qxUEXPz2UdlCCuVYCkMeRFHwoJg5GfCSC8HcBchnxwW6++o59/7IS7CIe4t0fMP3+WHT9HhZcKejqT4C3m33UWI2wl9gOTXHd28B2ldBs/kOGhkTx39x4NkGCedEc3No8rBO1IHk74l71cz69Mf3xEj5lxCgKtZ+28bjbwehdqUUY82NJ1YQvXBPkWE0M1ZfEZB+MpVomtHMjkXYrxSOP0oMrbzISZQYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vgg1Hi0MLVPgxy0+K8NCKM0sAJClvT4Ehrdb3w+tF/s=;
 b=NjswfoR+h2JnbgI2Kh4v+77P1GkuI+/Emn6jc1FNEDfJLjLTeff+l4t1rG0cjgyxqU1FIcy2BbJydv4Wx6vA7v8vbj2Up6LQi8t5CLfLi9raZBMoYmVXTjwpna2sJuaCVlC2xdAuAlc0+8XuRXemOra8Xr/p6FiGON+TiwAv45BADG2hM8DXdw1tNj1XfbzlXZMYI7NeK1Ff1c3FtWsnD8Wp+16FDHCeq+ywJKvVD4bwfFHj/4pe7mCBNuG79FXWSjvzAEg76X+t60R+NodWFkvIOkMMR1O4utxjEj5WSzmdwtaMbT4bbnu1xyLS8NW+oNcUMeTTG09c+emylO9Qvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vgg1Hi0MLVPgxy0+K8NCKM0sAJClvT4Ehrdb3w+tF/s=;
 b=uAJkUee6Twh4ER10hW4NSpSqEmINToi3iVaCEmMcwZHi33rIvnR7UtqvYXSPIYz3W8iJITTSvku1E9Lc383LOKbuxl53L2wVr3uuey42FxFz/Z7DUWfbS3jwMttZqDZZJFugGGUgoxedc8RqgHV6AZ+9EKnM5GTc38Tc5beYgis=
Received: from BY5PR12MB3844.namprd12.prod.outlook.com (2603:10b6:a03:1ad::24)
 by BY5PR12MB3937.namprd12.prod.outlook.com (2603:10b6:a03:194::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Wed, 13 May
 2020 08:16:13 +0000
Received: from BY5PR12MB3844.namprd12.prod.outlook.com
 ([fe80::28a7:8f61:f016:d829]) by BY5PR12MB3844.namprd12.prod.outlook.com
 ([fe80::28a7:8f61:f016:d829%6]) with mapi id 15.20.2979.033; Wed, 13 May 2020
 08:16:13 +0000
From: "Zhao, Jiange" <Jiange.Zhao@amd.com>
To: "Zhao, Jiange" <Jiange.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Add autodump debugfs node for gpu reset v4
Thread-Topic: [PATCH] drm/amdgpu: Add autodump debugfs node for gpu reset v4
Thread-Index: AQHWJeaTNbqo9qfICEe5kID/ozHWi6ilsNmI
Date: Wed, 13 May 2020 08:16:13 +0000
Message-ID: <BY5PR12MB38445689BC83AF85CF770F19E1BF0@BY5PR12MB3844.namprd12.prod.outlook.com>
References: <20200509094508.28909-1-jianzh@amd.com>
In-Reply-To: <20200509094508.28909-1-jianzh@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Christian.Koenig@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-13T08:16:12.136Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ee833d0d-6bb0-47e0-7abe-08d7f715e6e9
x-ms-traffictypediagnostic: BY5PR12MB3937:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB39377BCA7BD3F006C979CC95E1BF0@BY5PR12MB3937.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ksMMLEPmdyNOMNoTXbuUitLJbrAelpZz9jg/hawfQLNtC9Qo/Z1HhE5ijqmPsTTEOFF24ebHgPutLGhkF2Y1mL4YbbjWoaAxuEyP+mMtaOSr9rO3gLYQZK0Y5rEZmbj2G/Qux/kxSg1XSWqSsOZIJXoqLpkLyn0tzRMIfkOUR+pKCukNysyPWs/4dZ5MLggl4r+FjpU3GzfCoLI0Fo5mJj2C3m30z4778QNPambpiIbmm8R+yEFXeI43tuuWxq1YEhNtVYb+vF7vcWheu7bSSPqFWgp99XEchXlr2OBcUGzhC9pmgVTsczDIgos0Afdv8/WcEywKw9ppbv54HEcDGor0IUTMGqY5mY4WKYhwpyWAlfWkDT6XWc5LlhmgXtD5An+WWU27N8GnVMiLw/Jz8zD3nD+WgJ5nRvqR1qvhruKXqml9EpaCistdeRKQoI9aIT/vWcbn95kJqUuKKgxSTWjOB45cbwm4Dp9ricJ/ruKRu34n1siOjsy/3XUARDbGVWu0h+egPfUM3vtMzAhekg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3844.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(33430700001)(54906003)(110136005)(52536014)(19627405001)(186003)(26005)(53546011)(6506007)(9686003)(71200400001)(7696005)(55016002)(4326008)(8936002)(478600001)(33440700001)(76116006)(33656002)(316002)(66476007)(66446008)(8676002)(66556008)(64756008)(66946007)(86362001)(2906002)(5660300002)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 3qrFb04zwvH47s6MkvBla+j5KCJEysLW7mKoWPl+SgYATQAGDViFVeVOckPmKSqtjG0tEmRtFrD5n8RXWLbduCZnCgxImdUR2EbgisEKBHOlaD0zplQ50uxQ8vfcbw8Lf+4Q5cypYKwKDqXZ16guE/Dr9F9SbPQy78HQ78MdoA9hNbF5/oC4WLQ8kcvyhi+6wDJkT0HGuRwWodzx0zx3D15bv/GCpohQCWjzuIcP2sq99cNgsqu7mCaCmBiRH3RMsY7wy5NGnIXbuAVgUT5NT9KoqYypRD6ki+HzyAmlbwyC0JK7CbMzeTlKnen1/VlKit7QINwo7NZFbiFkIxQCWoPi59GbhrPeFg+/8Cbn2cKx4v77AJ57s5pbnRM629UnCZuu5a0UUoZUosNm7Hi77LIRjXXeHjvWMHnlo89BEh64dJxez/S5ucaHoQ/r8/nmmZhz2EglVn3fGLfDDFhyf3oxjSB7EhOlIsCeK43pQy3K7UmmYjeOeQXVmaG3p4+8
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee833d0d-6bb0-47e0-7abe-08d7f715e6e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 08:16:13.4700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26Rjp6vx2pyUHbDwsDLEelii3X27gDg9lsTtEmjy1S5e9i3d5FHMl/bKHmxCyFxv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3937
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pelloux-prayer,
 Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Content-Type: multipart/mixed; boundary="===============1300720574=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1300720574==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BY5PR12MB38445689BC83AF85CF770F19E1BF0BY5PR12MB3844namp_"

--_000_BY5PR12MB38445689BC83AF85CF770F19E1BF0BY5PR12MB3844namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Hi @Koenig, Christian<mailto:Christian.Koenig@amd.com>,

I made some changes on top of version 3 and tested it. Can you help review?

Jiange
________________________________
From: Zhao, Jiange <jianzh@amd.com>
Sent: Saturday, May 9, 2020 5:45 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Koenig, Christian <Christian.Koenig@amd.com>; Pelloux-prayer, Pierre-er=
ic <Pierre-eric.Pelloux-prayer@amd.com>; Deucher, Alexander <Alexander.Deuc=
her@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Zhao, Jiange <Jiange.Zhao@amd.c=
om>
Subject: [PATCH] drm/amdgpu: Add autodump debugfs node for gpu reset v4

From: Jiange Zhao <Jiange.Zhao@amd.com>

When GPU got timeout, it would notify an interested part
of an opportunity to dump info before actual GPU reset.

A usermode app would open 'autodump' node under debugfs system
and poll() for readable/writable. When a GPU reset is due,
amdgpu would notify usermode app through wait_queue_head and give
it 10 minutes to dump info.

After usermode app has done its work, this 'autodump' node is closed.
On node closure, amdgpu gets to know the dump is done through
the completion that is triggered in release().

There is no write or read callback because necessary info can be
obtained through dmesg and umr. Messages back and forth between
usermode app and amdgpu are unnecessary.

v2: (1) changed 'registered' to 'app_listening'
    (2) add a mutex in open() to prevent race condition

v3 (chk): grab the reset lock to avoid race in autodump_open,
          rename debugfs file to amdgpu_autodump,
          provide autodump_read as well,
          style and code cleanups

v4: add 'bool app_listening' to differentiate situations, so that
    the node can be reopened; also, there is no need to wait for
    completion when no app is waiting for a dump.

v5: change 'bool app_listening' to 'enum amdgpu_autodump_state'
    add 'app_state_mutex' for race conditions:
        (1)Only 1 user can open this file node
        (2)wait_dump() can only take effect after poll() executed.
        (3)eliminated the race condition between release() and
           wait_dump()

v6: removed 'enum amdgpu_autodump_state' and 'app_state_mutex'
    removed state checking in amdgpu_debugfs_wait_dump
    Improve on top of version 3 so that the node can be reopened.

Signed-off-by: Jiange Zhao <Jiange.Zhao@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 78 ++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h |  6 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  2 +
 4 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h
index 2a806cb55b78..9e8eeddfe7ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -992,6 +992,8 @@ struct amdgpu_device {
         char                            product_number[16];
         char                            product_name[32];
         char                            serial[16];
+
+       struct amdgpu_autodump          autodump;
 };

 static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *=
bdev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_debugfs.c
index 1a4894fa3693..261b67ece7fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -27,7 +27,7 @@
 #include <linux/pci.h>
 #include <linux/uaccess.h>
 #include <linux/pm_runtime.h>
-
+#include <linux/poll.h>
 #include <drm/drm_debugfs.h>

 #include "amdgpu.h"
@@ -74,8 +74,82 @@ int amdgpu_debugfs_add_files(struct amdgpu_device *adev,
         return 0;
 }

+int amdgpu_debugfs_wait_dump(struct amdgpu_device *adev)
+{
+#if defined(CONFIG_DEBUG_FS)
+       unsigned long timeout =3D 600 * HZ;
+       int ret;
+
+       wake_up_interruptible(&adev->autodump.gpu_hang);
+
+       ret =3D wait_for_completion_interruptible_timeout(&adev->autodump.d=
umping, timeout);
+       complete_all(&adev->autodump.dumping);
+       if (ret =3D=3D 0) {
+               pr_err("autodump: timeout, move on to gpu recovery\n");
+               return -ETIMEDOUT;
+       }
+#endif
+       return 0;
+}
+
 #if defined(CONFIG_DEBUG_FS)

+static int amdgpu_debugfs_autodump_open(struct inode *inode, struct file *=
file)
+{
+       struct amdgpu_device *adev =3D inode->i_private;
+       int ret;
+
+       file->private_data =3D adev;
+
+       mutex_lock(&adev->lock_reset);
+       if (adev->autodump.dumping.done)
+               ret =3D 0;
+       else
+               ret =3D -EBUSY;
+       mutex_unlock(&adev->lock_reset);
+
+       return ret;
+}
+
+static int amdgpu_debugfs_autodump_release(struct inode *inode, struct fil=
e *file)
+{
+       struct amdgpu_device *adev =3D file->private_data;
+
+       complete_all(&adev->autodump.dumping);
+       return 0;
+}
+
+static unsigned int amdgpu_debugfs_autodump_poll(struct file *file, struct=
 poll_table_struct *poll_table)
+{
+       struct amdgpu_device *adev =3D file->private_data;
+
+       reinit_completion(&adev->autodump.dumping);
+       poll_wait(file, &adev->autodump.gpu_hang, poll_table);
+
+       if (adev->in_gpu_reset)
+               return POLLIN | POLLRDNORM | POLLWRNORM;
+
+       return 0;
+}
+
+static const struct file_operations autodump_debug_fops =3D {
+       .owner =3D THIS_MODULE,
+       .open =3D amdgpu_debugfs_autodump_open,
+       .poll =3D amdgpu_debugfs_autodump_poll,
+       .release =3D amdgpu_debugfs_autodump_release,
+};
+
+static void amdgpu_debugfs_autodump_init(struct amdgpu_device *adev)
+{
+       init_completion(&adev->autodump.dumping);
+       complete_all(&adev->autodump.dumping);
+       init_waitqueue_head(&adev->autodump.gpu_hang);
+
+       debugfs_create_file("amdgpu_autodump", 0600,
+               adev->ddev->primary->debugfs_root,
+               adev, &autodump_debug_fops);
+}
+
 /**
  * amdgpu_debugfs_process_reg_op - Handle MMIO register reads/writes
  *
@@ -1434,6 +1508,8 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)

         amdgpu_ras_debugfs_create_all(adev);

+       amdgpu_debugfs_autodump_init(adev);
+
         return amdgpu_debugfs_add_files(adev, amdgpu_debugfs_list,
                                         ARRAY_SIZE(amdgpu_debugfs_list));
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_debugfs.h
index de12d1101526..2803884d338d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
@@ -31,6 +31,11 @@ struct amdgpu_debugfs {
         unsigned                num_files;
 };

+struct amdgpu_autodump {
+       struct completion               dumping;
+       struct wait_queue_head          gpu_hang;
+};
+
 int amdgpu_debugfs_regs_init(struct amdgpu_device *adev);
 int amdgpu_debugfs_init(struct amdgpu_device *adev);
 void amdgpu_debugfs_fini(struct amdgpu_device *adev);
@@ -40,3 +45,4 @@ int amdgpu_debugfs_add_files(struct amdgpu_device *adev,
 int amdgpu_debugfs_fence_init(struct amdgpu_device *adev);
 int amdgpu_debugfs_firmware_init(struct amdgpu_device *adev);
 int amdgpu_debugfs_gem_init(struct amdgpu_device *adev);
+int amdgpu_debugfs_wait_dump(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c
index cc41e8f5ad14..545beebcf43e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3927,6 +3927,8 @@ static int amdgpu_device_pre_asic_reset(struct amdgpu=
_device *adev,
         int i, r =3D 0;
         bool need_full_reset  =3D *need_full_reset_arg;

+       amdgpu_debugfs_wait_dump(adev);
+
         /* block all schedulers and reset given job's ring */
         for (i =3D 0; i < AMDGPU_MAX_RINGS; ++i) {
                 struct amdgpu_ring *ring =3D adev->rings[i];
--
2.20.1


--_000_BY5PR12MB38445689BC83AF85CF770F19E1BF0BY5PR12MB3844namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#0078D7;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi <a id=3D"OWAAM832723" class=3D"_1OtrSZdhKXVv3UhaivrdJ4 mention ms-bgc-nl=
r ms-fcl-b" href=3D"mailto:Christian.Koenig@amd.com">
@Koenig, Christian</a>,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I made some changes on top of version 3 and tested it. Can you help review?=
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jiange<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Zhao, Jiange &lt;jian=
zh@amd.com&gt;<br>
<b>Sent:</b> Saturday, May 9, 2020 5:45 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Pelloux-pray=
er, Pierre-eric &lt;Pierre-eric.Pelloux-prayer@amd.com&gt;; Deucher, Alexan=
der &lt;Alexander.Deucher@amd.com&gt;; Liu, Monk &lt;Monk.Liu@amd.com&gt;; =
Zhao, Jiange &lt;Jiange.Zhao@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Add autodump debugfs node for gpu reset=
 v4</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Jiange Zhao &lt;Jiange.Zhao@amd.com&gt;<br>
<br>
When GPU got timeout, it would notify an interested part<br>
of an opportunity to dump info before actual GPU reset.<br>
<br>
A usermode app would open 'autodump' node under debugfs system<br>
and poll() for readable/writable. When a GPU reset is due,<br>
amdgpu would notify usermode app through wait_queue_head and give<br>
it 10 minutes to dump info.<br>
<br>
After usermode app has done its work, this 'autodump' node is closed.<br>
On node closure, amdgpu gets to know the dump is done through<br>
the completion that is triggered in release().<br>
<br>
There is no write or read callback because necessary info can be<br>
obtained through dmesg and umr. Messages back and forth between<br>
usermode app and amdgpu are unnecessary.<br>
<br>
v2: (1) changed 'registered' to 'app_listening'<br>
&nbsp;&nbsp;&nbsp; (2) add a mutex in open() to prevent race condition<br>
<br>
v3 (chk): grab the reset lock to avoid race in autodump_open,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rename debugfs file =
to amdgpu_autodump,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; provide autodump_rea=
d as well,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; style and code clean=
ups<br>
<br>
v4: add 'bool app_listening' to differentiate situations, so that<br>
&nbsp;&nbsp;&nbsp; the node can be reopened; also, there is no need to wait=
 for<br>
&nbsp;&nbsp;&nbsp; completion when no app is waiting for a dump.<br>
<br>
v5: change 'bool app_listening' to 'enum amdgpu_autodump_state'<br>
&nbsp;&nbsp;&nbsp; add 'app_state_mutex' for race conditions:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1)Only 1 user can open this fil=
e node<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2)wait_dump() can only take eff=
ect after poll() executed.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (3)eliminated the race condition=
 between release() and<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wait_dump()<br=
>
<br>
v6: removed 'enum amdgpu_autodump_state' and 'app_state_mutex'<br>
&nbsp;&nbsp;&nbsp; removed state checking in amdgpu_debugfs_wait_dump<br>
&nbsp;&nbsp;&nbsp; Improve on top of version 3 so that the node can be reop=
ened.<br>
<br>
Signed-off-by: Jiange Zhao &lt;Jiange.Zhao@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; |&nbsp; 2 &#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 78 &#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h |&nbsp; 6 &#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_device.c&nbsp; |&nbsp; 2 &#43;<br>
&nbsp;4 files changed, 87 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h<br>
index 2a806cb55b78..9e8eeddfe7ce 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
@@ -992,6 &#43;992,8 @@ struct amdgpu_device {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; product_n=
umber[16];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; product_n=
ame[32];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; serial[16=
];<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_autodump&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; autodump;<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_dev=
ice *bdev)<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_debugfs.c<br>
index 1a4894fa3693..261b67ece7fb 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c<br>
@@ -27,7 &#43;27,7 @@<br>
&nbsp;#include &lt;linux/pci.h&gt;<br>
&nbsp;#include &lt;linux/uaccess.h&gt;<br>
&nbsp;#include &lt;linux/pm_runtime.h&gt;<br>
-<br>
&#43;#include &lt;linux/poll.h&gt;<br>
&nbsp;#include &lt;drm/drm_debugfs.h&gt;<br>
&nbsp;<br>
&nbsp;#include &quot;amdgpu.h&quot;<br>
@@ -74,8 &#43;74,82 @@ int amdgpu_debugfs_add_files(struct amdgpu_device *a=
dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;int amdgpu_debugfs_wait_dump(struct amdgpu_device *adev)<br>
&#43;{<br>
&#43;#if defined(CONFIG_DEBUG_FS)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long timeout =3D 600 * H=
Z;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wake_up_interruptible(&amp;adev-&=
gt;autodump.gpu_hang);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D wait_for_completion_inter=
ruptible_timeout(&amp;adev-&gt;autodump.dumping, timeout);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; complete_all(&amp;adev-&gt;autodu=
mp.dumping);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret =3D=3D 0) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pr_err(&quot;autodump: timeout, move on to gpu recovery\n&qu=
ot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -ETIMEDOUT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;#endif<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;}<br>
&#43;<br>
&nbsp;#if defined(CONFIG_DEBUG_FS)<br>
&nbsp;<br>
&#43;static int amdgpu_debugfs_autodump_open(struct inode *inode, struct fi=
le *file)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D in=
ode-&gt;i_private;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file-&gt;private_data =3D adev;<b=
r>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;adev-&gt;lock_res=
et);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;autodump.dumping.don=
e)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D -EBUSY;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;adev-&gt;lock_r=
eset);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&#43;<br>
&#43;static int amdgpu_debugfs_autodump_release(struct inode *inode, struct=
 file *file)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D fi=
le-&gt;private_data;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; complete_all(&amp;adev-&gt;autodu=
mp.dumping);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;}<br>
&#43;<br>
&#43;static unsigned int amdgpu_debugfs_autodump_poll(struct file *file, st=
ruct poll_table_struct *poll_table)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D fi=
le-&gt;private_data;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reinit_completion(&amp;adev-&gt;a=
utodump.dumping);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; poll_wait(file, &amp;adev-&gt;aut=
odump.gpu_hang, poll_table);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;in_gpu_reset)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return POLLIN | POLLRDNORM | POLLWRNORM;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;}<br>
&#43;<br>
&#43;static const struct file_operations autodump_debug_fops =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .owner =3D THIS_MODULE,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .open =3D amdgpu_debugfs_autodump=
_open,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .poll =3D amdgpu_debugfs_autodump=
_poll,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .release =3D amdgpu_debugfs_autod=
ump_release,<br>
&#43;};<br>
&#43;<br>
&#43;static void amdgpu_debugfs_autodump_init(struct amdgpu_device *adev)<b=
r>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; init_completion(&amp;adev-&gt;aut=
odump.dumping);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; complete_all(&amp;adev-&gt;autodu=
mp.dumping);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; init_waitqueue_head(&amp;adev-&gt=
;autodump.gpu_hang);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;amdgpu_=
autodump&quot;, 0600,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; adev-&gt;ddev-&gt;primary-&gt;debugfs_root,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; adev, &amp;autodump_debug_fops);<br>
&#43;}<br>
&#43;<br>
&nbsp;/**<br>
&nbsp; * amdgpu_debugfs_process_reg_op - Handle MMIO register reads/writes<=
br>
&nbsp; *<br>
@@ -1434,6 &#43;1508,8 @@ int amdgpu_debugfs_init(struct amdgpu_device *ade=
v)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ras_debugfs_create_=
all(adev);<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_debugfs_autodump_init(adev=
);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return amdgpu_debugfs_add_=
files(adev, amdgpu_debugfs_list,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ARRAY_SIZE(amdgpu_debugfs_list));<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_debugfs.h<br>
index de12d1101526..2803884d338d 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h<br>
@@ -31,6 &#43;31,11 @@ struct amdgpu_debugfs {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nu=
m_files;<br>
&nbsp;};<br>
&nbsp;<br>
&#43;struct amdgpu_autodump {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct completion&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dumpin=
g;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct wait_queue_head&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpu_hang;<br>
&#43;};<br>
&#43;<br>
&nbsp;int amdgpu_debugfs_regs_init(struct amdgpu_device *adev);<br>
&nbsp;int amdgpu_debugfs_init(struct amdgpu_device *adev);<br>
&nbsp;void amdgpu_debugfs_fini(struct amdgpu_device *adev);<br>
@@ -40,3 &#43;45,4 @@ int amdgpu_debugfs_add_files(struct amdgpu_device *ad=
ev,<br>
&nbsp;int amdgpu_debugfs_fence_init(struct amdgpu_device *adev);<br>
&nbsp;int amdgpu_debugfs_firmware_init(struct amdgpu_device *adev);<br>
&nbsp;int amdgpu_debugfs_gem_init(struct amdgpu_device *adev);<br>
&#43;int amdgpu_debugfs_wait_dump(struct amdgpu_device *adev);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c<br>
index cc41e8f5ad14..545beebcf43e 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
@@ -3927,6 &#43;3927,8 @@ static int amdgpu_device_pre_asic_reset(struct am=
dgpu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, r =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool need_full_reset&nbsp;=
 =3D *need_full_reset_arg;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_debugfs_wait_dump(adev);<b=
r>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* block all schedulers an=
d reset given job's ring */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; AMDGP=
U_MAX_RINGS; &#43;&#43;i) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring *ring =3D adev-&gt;rings[i];<br>
-- <br>
2.20.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BY5PR12MB38445689BC83AF85CF770F19E1BF0BY5PR12MB3844namp_--

--===============1300720574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1300720574==--
