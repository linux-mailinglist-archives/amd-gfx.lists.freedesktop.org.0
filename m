Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDDAB75EF
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 11:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24E06F9A1;
	Thu, 19 Sep 2019 09:14:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750070.outbound.protection.outlook.com [40.107.75.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B516F9A1
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 09:14:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbU5mLcx4WFtME5+VDb3N+74OKZkQE6D+mDv5j8+8fmunJ2W5ADseVbAtSjySWe8WQdXBcFltqiPF5W73rqM5QGE/Otc7ZOuLrQ+3kCtiYHZpMol570CGxYw/LCi7yk1tv27mMIAbRrXpATNvux8WV/DXMRnrz4AgJLTh1h1/3MqZ3NRuaOEj/hMAK2B9zj1j5eSnQ3KUyJNRqzkRBpHXx0vNiUv73JANNrvz/3FMvwaZZYpD99eJxHqm4h8lyg6uAOKy1mUBnBXITtQmeOpvm9Zii95BblJHNeDH6CDPKb7RHTWgLkMx162J9pHzXqnHp/HzCKsoDXdBW/yWsRa7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdXYYGCcV4shMAI7qceKdBE3Ca6HuqWRYgTIzCcgctw=;
 b=UXDNy+IGBckK2PwZm3LxRjoOf1G+bs3B7LE36g2rjKOkhBTZQNRiDeCh+LkY5QY4Ghr5aLiXllRmhOO0BClftyAjC7c/aVtf+MDqhnYisjCHiNl3Gz8WiV2VJoMhN1X6pqcQTZLkGU+C/0WPyhq2PFe2+6Ur+pxF5EGKJd/+3zX+L0XGRDMLgLPhmNsFg7BKlt4iVKBCv838iA1/9CfKTLJm3vUuN4iFPgw8xYydlxvGRKZtI7bm6jAiD9NIhkRn+JS3aQsmw62hKtXGXJGNyd/hwnqL3TNoT+h2VDmLzMNWr7J6L36wRrU3NgrqEfbE3d5HqwGpwoWTj0umWF3UtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB3311.namprd12.prod.outlook.com (20.179.82.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Thu, 19 Sep 2019 09:14:46 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e%7]) with mapi id 15.20.2284.009; Thu, 19 Sep 2019
 09:14:46 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Topic: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Index: AQHVbgWu2rFDa0rF+0CzJp1BGtWXeKcxMqhggAAJS4CAAAThAIABDymwgAAIE5CAAF5mcIAAAIAggAACSeA=
Date: Thu, 19 Sep 2019 09:14:46 +0000
Message-ID: <MN2PR12MB2975A799AE3241ED5D99324D8F890@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <8cad9ead-c2da-43b1-91d1-0291e02c5fd8@email.android.com>
 <MN2PR12MB2975280FA830F69A96966A3E8F8E0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <3b31520d-c5eb-06f9-5468-0161f9adafc8@amd.com>
 <ba054c85-f0ab-93f1-13b6-b9e550c99522@amd.com>
 <MN2PR12MB2975EB0D2D2F7041C6E62EB38F890@MN2PR12MB2975.namprd12.prod.outlook.com>
 <CH2PR12MB367243AEED44642A9AA3CB46BB890@CH2PR12MB3672.namprd12.prod.outlook.com>,
 <MN2PR12MB2975A9B332A8D1D34C3130E08F890@MN2PR12MB2975.namprd12.prod.outlook.com>
 <5810a3fe-7929-48da-b09c-8ec4f4e2ca23@email.android.com>
In-Reply-To: <5810a3fe-7929-48da-b09c-8ec4f4e2ca23@email.android.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c53eac6-0bff-4dae-a371-08d73ce1d0ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3311; 
x-ms-traffictypediagnostic: MN2PR12MB3311:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB331191A2703EA3A3AF69CE038F890@MN2PR12MB3311.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(199004)(13464003)(189003)(51444003)(76116006)(86362001)(476003)(9686003)(14444005)(55016002)(6436002)(186003)(54896002)(71190400001)(6116002)(64756008)(256004)(66556008)(236005)(790700001)(3846002)(66476007)(66446008)(66574012)(6246003)(52536014)(6306002)(66946007)(316002)(2906002)(5660300002)(71200400001)(6636002)(102836004)(478600001)(14454004)(229853002)(33656002)(6862004)(6506007)(4326008)(76176011)(486006)(8676002)(8936002)(74316002)(446003)(25786009)(54906003)(81166006)(7696005)(81156014)(99286004)(53546011)(66066001)(26005)(11346002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3311;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SjJFIMNkwfCfLHF0zRrb6daL97BwYpUgN7AurR/cwIyDuoVafkUHKfLzp8sJL7rYayd8u1ZPnkaqiki7v0cvg6CbxWXVSDpW/H4EQqRE8otF2U9TEgUuk1t8y2vNz7bfqNqGdzk8V1+FGL5MJA9LsJEGiqcXPMeXm4VhkFeOrUgtR4erzQxNq1O9oDfPIBXJFGipS5ibKz482YzNI9ocMDqfGv3VUX4S3kcGEzWdbnL20UCTaIHrREuQQKFJRamnFMogLsG0gRCObaEqlB9NNTs2LgOW6V9RH6DCiv4F2ZN/6tZ+KDoRYcE19EEZHFWB3ACD/uETLULJ343Cb2jv+/XBb99wCLKmu/QOme8KL66rXtREteqTzQStRhZaIwZmGv5Sq1rgyc6Nnt1Bsy0gf7sVhGCeA8WZ8YBPFhcJjh0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c53eac6-0bff-4dae-a371-08d73ce1d0ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 09:14:46.4488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GUd6yTeinpySmzlIbUYuor2WtQmhhrQ32ZHtuxSUvKCGD2N8Q874QTsfpEH8+Omi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3311
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdXYYGCcV4shMAI7qceKdBE3Ca6HuqWRYgTIzCcgctw=;
 b=r+EX7gp53bWC//lHf8PjfO6AwTfHbfxj1GmKuKtV7oBNK72Ww1aVggwksu2DhPUgV6PNubfT73j+VNoJ34qIGCMJlx+zuWPZ8/5nl5sDzboA8MY7b404jPEeTOFdm05XQBwfapgZFIK6iKtbbdAdYVbrzNGoPLbtbORWHFmdC/g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "Zhang, Jack \(Jian\)" <Jack.Zhang1@amd.com>, "Cui,
 Flora" <Flora.Cui@amd.com>, "Teng, Rui" <Rui.Teng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1566588499=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1566588499==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB2975A799AE3241ED5D99324D8F890MN2PR12MB2975namp_"

--_000_MN2PR12MB2975A799AE3241ED5D99324D8F890MN2PR12MB2975namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ok, thanks very much.

Best wishes
Emily Deng
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Thursday, September 19, 2019 5:06 PM
To: Deng, Emily <Emily.Deng@amd.com>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>; amd-gfx@lists.freedesktop.org=
; Teng, Rui <Rui.Teng@amd.com>; Cui, Flora <Flora.Cui@amd.com>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through

I can create a patch based on this today and push it on Monday.

Christian.

Am 19.09.2019 11:05 schrieb "Deng, Emily" <Emily.Deng@amd.com<mailto:Emily.=
Deng@amd.com>>:
Hi Christian,
Could you please help to push the code?

Best wishes
Emily Deng
From: Zhang, Jack (Jian) <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>
Sent: Thursday, September 19, 2019 11:33 AM
To: Deng, Emily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>; Koenig, Ch=
ristian <Christian.Koenig@amd.com<mailto:Christian.Koenig@amd.com>>
Cc: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Te=
ng, Rui <Rui.Teng@amd.com<mailto:Rui.Teng@amd.com>>; Cui, Flora <Flora.Cui@=
amd.com<mailto:Flora.Cui@amd.com>>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through




Reviewed & Tested-by: Jack Zhang <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@am=
d.com>>

BR,
Jack
From: Deng, Emily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>
Sent: Thursday, September 19, 2019 10:58 AM
To: Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@amd=
.com>>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>; a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Teng, R=
ui <Rui.Teng@amd.com<mailto:Rui.Teng@amd.com>>; Cui, Flora <Flora.Cui@amd.c=
om<mailto:Flora.Cui@amd.com>>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through

Hi Jack,
Could you please give a try about this? Both for passthrough and sriov.

Best wishes
Emily Deng
From: Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@a=
md.com>>
Sent: Wednesday, September 18, 2019 6:47 PM
To: Deng, Emily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>; a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Teng, R=
ui <Rui.Teng@amd.com<mailto:Rui.Teng@amd.com>>; Cui, Flora <Flora.Cui@amd.c=
om<mailto:Flora.Cui@amd.com>>
Subject: Re: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through

Hi Jack & Emily,

asking around a bit helped, we should be able to take a look at the module =
state to distinct the two use cases like this:

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 6b96a5738e57..0af134eb03e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1074,7 +1074,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 {
        struct drm_device *dev =3D pci_get_drvdata(pdev);

-       DRM_ERROR("Device removal is currently not supported outside of fbc=
on\n");
+#ifdef MODULE
+       if (THIS_MODULE->state !=3D MODULE_STATE_GOING)
+#endif
+               DRM_ERROR("Device removal is currently not supported outsid=
e of fbcon\n");
        drm_dev_unplug(dev);
        drm_dev_put(dev);
        pci_disable_device(pdev);

It's a bit of a hack, but I think that this should work.

Regards,
Christian.

Am 18.09.19 um 12:29 schrieb Christian K=F6nig:
Hi Emily,
Do you think this is because the wrong use case?
Well Jack's use case is correct, but the PCIe hot plug removal use case is =
incorrect.

Changing it to a warning is most likely not a good idea either because it i=
s indeed an error to try to use PCIe hot plug removal.

What we need to distinct is why the function is called, if it's because of =
pci_unregister_driver(&amdgpu_kms_pci_driver) in amdgpu_exit() then the use=
 case is valid and we should not print the error.

But if it's because somebody does something like "echo 1 > /sys/bus/pci/dev=
ices/0000\:0b\:00.1/remove" then that is invalid and we should print it.

We could do some hack and look at the stack trace, but that is probably not=
 reliable either.

Maybe we can look at the module reference count or something like that.

Regards,
Christian.

Am 18.09.19 um 12:04 schrieb Deng, Emily:
Hi Christian,
Do you think this is because the wrong use case? Even we add the error log,=
 the issue still happens. Could we change this error to warning? As for the=
 right method to remove the driver, it shouldn't occur issues.

Best wishes
Emily Deng
From: Koenig, Christian <Christian.Koenig@amd.com><mailto:Christian.Koenig@=
amd.com>
Sent: Wednesday, September 18, 2019 5:45 PM
To: Deng, Emily <Emily.Deng@amd.com><mailto:Emily.Deng@amd.com>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com><mailto:Jack.Zhang1@amd.com>; a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Teng, R=
ui <Rui.Teng@amd.com><mailto:Rui.Teng@amd.com>; Cui, Flora <Flora.Cui@amd.c=
om><mailto:Flora.Cui@amd.com>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through

Yes, exactly.

The problem is that even when output is qxl or the Intel driver our driver =
is still loaded and forcefully removing it renders the desktop unusable.

Christian.


Am 18.09.2019 11:24 schrieb "Deng, Emily" <Emily.Deng@amd.com<mailto:Emily.=
Deng@amd.com>>:

Hi Christian,

Do you mean, for passthrough mode, the desktop is rendered by our asic, but=
 enduser is trying to remove the driver by hot plug?



Best wishes

Emily Deng

From: Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@a=
md.com>>
Sent: Wednesday, September 18, 2019 4:44 PM
To: Deng, Emily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>; a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Teng, R=
ui <Rui.Teng@amd.com<mailto:Rui.Teng@amd.com>>; Cui, Flora <Flora.Cui@amd.c=
om<mailto:Flora.Cui@amd.com>>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through



Hi Emily,



Yeah, exactly that's the problem: In some cases the driver can be unloaded =
while it is still in use!



See we added this error message because endusers tried to use PCIe hot plug=
 to unload the driver to use the hardware for paththrough.



But this will completely nuke your desktop, even when amdgpu is only a seco=
ndary device like in the qxl case.



Jack is using the correct way of doing it, e.g. using "modprobe -r" or rmmo=
d. Both commands check the use count before unloading the driver instances.



I don't see a way to distingt the two cases and what Jack is doing is unfor=
tunate not the common one.



Regards,

Christian.





Am 18.09.2019 10:08 schrieb "Deng, Emily" <Emily.Deng@amd.com<mailto:Emily.=
Deng@amd.com>>:

Hi Christian,

     Before unloading driver, user must sure there is not any userspace to =
use of amdgpu, if not, it will report driver is in use. And the unloading d=
river is a feature about amdgpu driver which will be easier to replace driv=
er without rebooting VM. Do you think it has any issue about driver unloadi=
ng path?



Best wishes

Emily Deng

From: Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@a=
md.com>>
Sent: Wednesday, September 18, 2019 3:54 PM
To: Zhang, Jack (Jian) <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>
Cc: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Te=
ng, Rui <Rui.Teng@amd.com<mailto:Rui.Teng@amd.com>>; Deng, Emily <Emily.Den=
g@amd.com<mailto:Emily.Deng@amd.com>>; Cui, Flora <Flora.Cui@amd.com<mailto=
:Flora.Cui@amd.com>>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through



Hi Jack,



Well that believe is unfortunately completely wrong.



The point is that ANY use of amdgpu by userspace will prevent correct drive=
r unload, that qxl is used for the fbcon doesn't change anything here.



So the patch is a clear NAK. Driver unload is not supposed to work even und=
er SRIOV.



Regards,

Christian.







Am 18.09.2019 09:32 schrieb "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com<mailt=
o:Jack.Zhang1@amd.com>>:

Hi, Christian and folks,

In virtual machines(such virt-manager), there's always a virtual graphics d=
evice existed like "qxl" as the default gfx device.
So under such condition, we believe it's reasonable to unload amdgpu driver=
 as it is not treated as the default fbcon device.

Would you please help to review this patch?

Best wishes,
Jack

-----Original Message-----
From: Jack Zhang <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>
Sent: Wednesday, September 18, 2019 3:25 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>
Subject: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or passthro=
ugh

In virtual machine, there would be a qxl or cirrus graphics device as the d=
efault master fbcon device.

So for PF(passthrough mode) or SRIOV VF, it is reasonable to unload amdgpu =
driver. Amdgpu doesn't have to be the only fbcon device under this conditio=
n.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 420888e..ada2b25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1103,8 +1103,9 @@ static void
 amdgpu_pci_remove(struct pci_dev *pdev)  {
         struct drm_device *dev =3D pci_get_drvdata(pdev);
-
-       DRM_ERROR("Device removal is currently not supported outside of fbc=
on\n");
+       struct amdgpu_device *adev =3D dev->dev_private;
+       if (!amdgpu_sriov_vf(adev) && !amdgpu_passthrough(adev))
+               DRM_ERROR("     currently not supported outside of
+fbcon\n");
         drm_dev_unplug(dev);
         drm_dev_put(dev);
         pci_disable_device(pdev);
--
2.7.4






--_000_MN2PR12MB2975A799AE3241ED5D99324D8F890MN2PR12MB2975namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:Consolas;
	color:black;}
p.msonormal00, li.msonormal00, div.msonormal00
	{mso-style-name:msonormal0;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
p.msochpdefault, li.msochpdefault, div.msochpdefault
	{mso-style-name:msochpdefault;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.plaintextchar0
	{mso-style-name:plaintextchar;
	font-family:"Calibri",sans-serif;}
span.emailstyle20
	{mso-style-name:emailstyle20;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.emailstyle21
	{mso-style-name:emailstyle21;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.emailstyle22
	{mso-style-name:emailstyle22;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.emailstyle25
	{mso-style-name:emailstyle25;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle29
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Ok, thanks very muc=
h.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Best wishes<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Emily Deng<o:p></o:=
p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> Koenig, Christian &lt;Christian.Koenig@am=
d.com&gt;
<br>
<b>Sent:</b> Thursday, September 19, 2019 5:06 PM<br>
<b>To:</b> Deng, Emily &lt;Emily.Deng@amd.com&gt;<br>
<b>Cc:</b> Zhang, Jack (Jian) &lt;Jack.Zhang1@amd.com&gt;; amd-gfx@lists.fr=
eedesktop.org; Teng, Rui &lt;Rui.Teng@amd.com&gt;; Cui, Flora &lt;Flora.Cui=
@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">I can create a patc=
h based on this today and push it on Monday.
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Christian.<o:p></o:=
p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Am 19.09.2019 11:05=
 schrieb &quot;Deng, Emily&quot; &lt;<a href=3D"mailto:Emily.Deng@amd.com">=
Emily.Deng@amd.com</a>&gt;:<o:p></o:p></span></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Hi Christian,</span=
><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:10.0pt"><span style=3D"color:wi=
ndowtext">Could you please help to push the code?</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Best wishes</span><=
o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Emily Deng</span><o=
:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> Zhang, Jack (Jian) &lt;<a href=3D"mailto:=
Jack.Zhang1@amd.com">Jack.Zhang1@amd.com</a>&gt;
<br>
<b>Sent:</b> Thursday, September 19, 2019 11:33 AM<br>
<b>To:</b> Deng, Emily &lt;<a href=3D"mailto:Emily.Deng@amd.com">Emily.Deng=
@amd.com</a>&gt;; Koenig, Christian &lt;<a href=3D"mailto:Christian.Koenig@=
amd.com">Christian.Koenig@amd.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a>; Teng, Rui &lt;<a href=3D"mailto:Rui.Teng@amd.com">Rui.T=
eng@amd.com</a>&gt;; Cui, Flora &lt;<a href=3D"mailto:Flora.Cui@amd.com">Fl=
ora.Cui@amd.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough</span><o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoPlainText">Reviewed &amp; Tested-by: Jack Zhang &lt;<a href=
=3D"mailto:Jack.Zhang1@amd.com">Jack.Zhang1@amd.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">BR,</span><o:p></o:=
p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Jack</span><o:p></o=
:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> Deng, Emily &lt;<a href=3D"mailto:Emily.D=
eng@amd.com">Emily.Deng@amd.com</a>&gt;
<br>
<b>Sent:</b> Thursday, September 19, 2019 10:58 AM<br>
<b>To:</b> Koenig, Christian &lt;<a href=3D"mailto:Christian.Koenig@amd.com=
">Christian.Koenig@amd.com</a>&gt;<br>
<b>Cc:</b> Zhang, Jack (Jian) &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Ja=
ck.Zhang1@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>; Teng, Rui &lt;<a href=3D"mailto:Rui.Teng@amd.com">Rui.Teng@amd.com=
</a>&gt;; Cui, Flora &lt;<a href=3D"mailto:Flora.Cui@amd.com">Flora.Cui@amd=
.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough</span><o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Hi Jack,</span><o:p=
></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:10.0pt"><span style=3D"color:wi=
ndowtext">Could you please give a try about this? Both for passthrough and =
sriov.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Best wishes</span><=
o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Emily Deng</span><o=
:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> Koenig, Christian &lt;<a href=3D"mailto:C=
hristian.Koenig@amd.com">Christian.Koenig@amd.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, September 18, 2019 6:47 PM<br>
<b>To:</b> Deng, Emily &lt;<a href=3D"mailto:Emily.Deng@amd.com">Emily.Deng=
@amd.com</a>&gt;<br>
<b>Cc:</b> Zhang, Jack (Jian) &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Ja=
ck.Zhang1@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>; Teng, Rui &lt;<a href=3D"mailto:Rui.Teng@amd.com">Rui.Teng@amd.com=
</a>&gt;; Cui, Flora &lt;<a href=3D"mailto:Flora.Cui@amd.com">Flora.Cui@amd=
.com</a>&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough</span><o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">Hi Jack &amp; Emily,<br>
<br>
asking around a bit helped, we should be able to take a look at the module =
state to distinct the two use cases like this:<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 6b96a5738e57..0af134eb03e2 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -1074,7 &#43;1074,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D pci_g=
et_drvdata(pdev);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Device removal is cur=
rently not supported outside of fbcon\n&quot;);<br>
&#43;#ifdef MODULE<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (THIS_MODULE-&gt;state !=3D MO=
DULE_STATE_GOING)<br>
&#43;#endif<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; DRM_ERROR(&quot;Device removal is currently not supported ou=
tside of fbcon\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_unplug(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_put(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_disable_device(pdev);<br>
<br>
It's a bit of a hack, but I think that this should work.<br>
<br>
Regards,<br>
Christian.<br>
<br>
Am 18.09.19 um 12:29 schrieb Christian K=F6nig:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Hi Emily,<o:p></o:p><=
/p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">Do you think this is because the wrong use case?<o:p=
></o:p></p>
</blockquote>
<p class=3D"MsoNormal">Well Jack's use case is correct, but the PCIe hot pl=
ug removal use case is incorrect.<br>
<br>
Changing it to a warning is most likely not a good idea either because it i=
s indeed an error to try to use PCIe hot plug removal.<br>
<br>
What we need to distinct is why the function is called, if it's because of =
pci_unregister_driver(&amp;amdgpu_kms_pci_driver) in amdgpu_exit() then the=
 use case is valid and we should not print the error.<br>
<br>
But if it's because somebody does something like &quot;echo 1 &gt; /sys/bus=
/pci/devices/0000\:0b\:00.1/remove&quot; then that is invalid and we should=
 print it.<br>
<br>
We could do some hack and look at the stack trace, but that is probably not=
 reliable either.<br>
<br>
Maybe we can look at the module reference count or something like that.<br>
<br>
Regards,<br>
Christian.<br>
<br>
Am 18.09.19 um 12:04 schrieb Deng, Emily:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">Hi Christian,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:10.0pt">Do you think this is be=
cause the wrong use case? Even we add the error log, the issue still happen=
s. Could we change this error to warning? As for the right method to remove=
 the driver, it shouldn&#8217;t occur issues.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Best wishes<o:p></o:p></p>
<p class=3D"MsoNormal">Emily Deng<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Koenig, Christian <a href=3D"mailto:Chr=
istian.Koenig@amd.com">
&lt;Christian.Koenig@amd.com&gt;</a> <br>
<b>Sent:</b> Wednesday, September 18, 2019 5:45 PM<br>
<b>To:</b> Deng, Emily <a href=3D"mailto:Emily.Deng@amd.com">&lt;Emily.Deng=
@amd.com&gt;</a><br>
<b>Cc:</b> Zhang, Jack (Jian) <a href=3D"mailto:Jack.Zhang1@amd.com">&lt;Ja=
ck.Zhang1@amd.com&gt;</a>;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>; Teng, Rui
<a href=3D"mailto:Rui.Teng@amd.com">&lt;Rui.Teng@amd.com&gt;</a>; Cui, Flor=
a <a href=3D"mailto:Flora.Cui@amd.com">
&lt;Flora.Cui@amd.com&gt;</a><br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Yes, exactly.<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">The problem is that even when output is qxl or the I=
ntel driver our driver is still loaded and forcefully removing it renders t=
he desktop unusable.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Christian.<o:p></o:p></p>
</div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">Am 18.09.2019 11:24 schrieb &quot;Deng, Emily&quot; =
&lt;<a href=3D"mailto:Emily.Deng@amd.com">Emily.Deng@amd.com</a>&gt;:<o:p><=
/o:p></p>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<div>
<div>
<p>Hi Christian,<o:p></o:p></p>
<p style=3D"text-indent:10.0pt">Do you mean, for passthrough mode, the desk=
top is rendered by our asic, but enduser is trying to remove the driver by =
hot plug?<o:p></o:p></p>
<p>&nbsp;<o:p></o:p></p>
<p>Best wishes<o:p></o:p></p>
<p>Emily Deng<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p><b>From:</b> Koenig, Christian &lt;<a href=3D"mailto:Christian.Koenig@am=
d.com">Christian.Koenig@amd.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, September 18, 2019 4:44 PM<br>
<b>To:</b> Deng, Emily &lt;<a href=3D"mailto:Emily.Deng@amd.com">Emily.Deng=
@amd.com</a>&gt;<br>
<b>Cc:</b> Zhang, Jack (Jian) &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Ja=
ck.Zhang1@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>; Teng, Rui &lt;<a href=3D"mailto:Rui.Teng@amd.com">Rui.Teng@amd.com=
</a>&gt;; Cui, Flora &lt;<a href=3D"mailto:Flora.Cui@amd.com">Flora.Cui@amd=
.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough<o:p></o:p></p>
</div>
</div>
<p>&nbsp;<o:p></o:p></p>
<div>
<div>
<p>Hi Emily,<o:p></o:p></p>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
<div>
<p>Yeah, exactly that's the problem: In some cases the driver can be unload=
ed while it is still in use!<o:p></o:p></p>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
<div>
<p>See we added this error message because endusers tried to use PCIe hot p=
lug to unload the driver to use the hardware for paththrough.<o:p></o:p></p=
>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
<div>
<p>But this will completely nuke your desktop, even when amdgpu is only a s=
econdary device like in the qxl case.<o:p></o:p></p>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
<div>
<p>Jack is using the correct way of doing it, e.g. using &quot;modprobe -r&=
quot; or rmmod. Both commands check the use count before unloading the driv=
er instances.<o:p></o:p></p>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
<div>
<p>I don't see a way to distingt the two cases and what Jack is doing is un=
fortunate not the common one.<o:p></o:p></p>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
<div>
<p>Regards,<o:p></o:p></p>
</div>
<div>
<p>Christian.<o:p></o:p></p>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
<div>
<p>Am 18.09.2019 10:08 schrieb &quot;Deng, Emily&quot; &lt;<a href=3D"mailt=
o:Emily.Deng@amd.com">Emily.Deng@amd.com</a>&gt;:<o:p></o:p></p>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<div>
<div>
<p>Hi Christian,<o:p></o:p></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp; Before unloading driver, user must sure there i=
s not any userspace to use of amdgpu, if not, it will report driver is in u=
se. And the unloading driver is a feature about amdgpu driver which will be=
 easier to replace driver without rebooting VM. Do you
 think it has any issue about driver unloading path?<o:p></o:p></p>
<p>&nbsp;<o:p></o:p></p>
<p>Best wishes<o:p></o:p></p>
<p>Emily Deng<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p><b>From:</b> Koenig, Christian &lt;<a href=3D"mailto:Christian.Koenig@am=
d.com">Christian.Koenig@amd.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, September 18, 2019 3:54 PM<br>
<b>To:</b> Zhang, Jack (Jian) &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Ja=
ck.Zhang1@amd.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a>; Teng, Rui &lt;<a href=3D"mailto:Rui.Teng@amd.com">Rui.T=
eng@amd.com</a>&gt;; Deng, Emily &lt;<a href=3D"mailto:Emily.Deng@amd.com">=
Emily.Deng@amd.com</a>&gt;; Cui, Flora &lt;<a href=3D"mailto:Flora.Cui@amd.=
com">Flora.Cui@amd.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough<o:p></o:p></p>
</div>
</div>
<p>&nbsp;<o:p></o:p></p>
<div>
<div>
<p>Hi Jack,<o:p></o:p></p>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
<div>
<p>Well that believe is unfortunately completely wrong.<o:p></o:p></p>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
<div>
<p>The point is that ANY use of amdgpu by userspace will prevent correct dr=
iver unload, that qxl is used for the fbcon doesn't change anything here.<o=
:p></o:p></p>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
<div>
<p>So the patch is a clear NAK. Driver unload is not supposed to work even =
under SRIOV.<o:p></o:p></p>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
<div>
<p>Regards,<o:p></o:p></p>
</div>
<div>
<p>Christian.<o:p></o:p></p>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<p>&nbsp;<o:p></o:p></p>
<div>
<p>Am 18.09.2019 09:32 schrieb &quot;Zhang, Jack (Jian)&quot; &lt;<a href=
=3D"mailto:Jack.Zhang1@amd.com">Jack.Zhang1@amd.com</a>&gt;:<o:p></o:p></p>
</div>
</div>
</div>
<div>
<p style=3D"margin-bottom:12.0pt">Hi, Christian and folks,<br>
<br>
In virtual machines(such virt-manager), there's always a virtual graphics d=
evice existed like &quot;qxl&quot; as the default gfx device.<br>
So under such condition, we believe it's reasonable to unload amdgpu driver=
 as it is not treated as the default fbcon device.<br>
<br>
Would you please help to review this patch?<br>
<br>
Best wishes,<br>
Jack<br>
<br>
-----Original Message-----<br>
From: Jack Zhang &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Jack.Zhang1@amd=
.com</a>&gt; <br>
Sent: Wednesday, September 18, 2019 3:25 PM<br>
To: <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesk=
top.org</a><br>
Cc: Zhang, Jack (Jian) &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Jack.Zhan=
g1@amd.com</a>&gt;<br>
Subject: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or passthro=
ugh<br>
<br>
In virtual machine, there would be a qxl or cirrus graphics device as the d=
efault master fbcon device.<br>
<br>
So for PF(passthrough mode) or SRIOV VF, it is reasonable to unload amdgpu =
driver. Amdgpu doesn't have to be the only fbcon device under this conditio=
n.<br>
<br>
Signed-off-by: Jack Zhang &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Jack.Z=
hang1@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 &#43;&#43;&#43;--<br>
&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 420888e..ada2b25 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -1103,8 &#43;1103,9 @@ static void<br>
&nbsp;amdgpu_pci_remove(struct pci_dev *pdev)&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D=
 pci_get_drvdata(pdev);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Device removal is cur=
rently not supported outside of fbcon\n&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D de=
v-&gt;dev_private;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(adev) &amp;&=
amp; !amdgpu_passthrough(adev))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; DRM_ERROR(&quot;&nbsp;&nbsp; &nbsp; currently not supported =
outside of <br>
&#43;fbcon\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_unplug(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_put(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_disable_device(pdev);<=
br>
--<br>
2.7.4<o:p></o:p></p>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<p>&nbsp;<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
</div>
</div>
</blockquote>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</blockquote>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB2975A799AE3241ED5D99324D8F890MN2PR12MB2975namp_--

--===============1566588499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1566588499==--
