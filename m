Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CE3BEAD3
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 05:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE8E6E0B9;
	Thu, 26 Sep 2019 03:14:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760080.outbound.protection.outlook.com [40.107.76.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925C26E0B9
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 03:14:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXyl3AzOKTezJzLmiFMqAPrXgmyL7bYK2CHof3fo6Du3tNHYPF8VlmcPo6U3mRWZheOCvtr0xm08Sq2vXirTvxBSwyXOn+rpS+Pp1lHNUZlPKazcFXLFDqbr/HO3DM7V4+wQICOnrytUYIEtq7QJw27Nb+Xj4c1ktSgPfy7Ux2nfciR1x5bsyABGBdUZNtrkAY0nlYZSos2Li3sQXypsY/xLstz2xiCf+mEgOfhRWLWmUZhj+A2uhIVPQ8fsHDhY472GFoAR7EanJnZhP4B2/EQ3m50QKlhfZDXkbVhcfCAkFXozmrrb2ldwkEl31cB4IuamB+awANy68nV5GJtsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OcdxA5yu3OMooav5nXh+/ut/Gn8/6Sp5oTv3PCuJgc=;
 b=RUlhkURWXgTM92KE9G2en9mohR0dV584vPtn3oadP5XH3K1peadL5+8pQ8n/6BsvAdEJ9lH8lk/q2VW7p0sG804RiiI7BUaf4ak4P7Z6BG617dCm7TMzzIqXJUoekrvvksg/x3w7ACB5s73ntX41dGLmxHEeVUHziVp4nb3MDGFs9MoXHFVHoMleiSnoDV0ZR1wACV1Zrq0JhEUKQbxinAXprgmxMfNWMYPUMZzs6SI1vPX7BpK1OzQrHH02KN7LXco/rgAlRkx09b5j0pR7PxuQ8Dst/rywi5z8g+Hr5gLuMyR0eZK3YLkY0oE2ovwYhMqBnvOSbMsB0mUpLksEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3226.namprd12.prod.outlook.com (20.179.105.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Thu, 26 Sep 2019 03:14:31 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 03:14:31 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Cornwall, Jay" <Jay.Cornwall@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Fix race in gfx10 context restore handler
Thread-Topic: [PATCH] drm/amdkfd: Fix race in gfx10 context restore handler
Thread-Index: AQHVc+2HE1dFSpdTo0+lYhae5xn2zKc9SQK3
Date: Thu, 26 Sep 2019 03:14:30 +0000
Message-ID: <DM6PR12MB27781E9620850E578BB5BA0AF0860@DM6PR12MB2778.namprd12.prod.outlook.com>
References: <1569449197-4637-1-git-send-email-jay.cornwall@amd.com>
In-Reply-To: <1569449197-4637-1-git-send-email-jay.cornwall@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:209f:ebca:1cfc:2cb6:dc33:8cb1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc823754-94f5-4d88-9f89-08d7422fa5e4
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3226:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB322677C64AF5A3773DC3547BF0860@DM6PR12MB3226.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:506;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(199004)(189003)(478600001)(33656002)(8936002)(76176011)(46003)(316002)(966005)(105004)(11346002)(2906002)(110136005)(446003)(476003)(8676002)(606006)(71190400001)(6246003)(186003)(6116002)(71200400001)(81156014)(76116006)(66946007)(64756008)(66476007)(19627405001)(53546011)(66556008)(66446008)(6506007)(81166006)(486006)(14454004)(6436002)(55016002)(6306002)(54896002)(236005)(9686003)(102836004)(229853002)(7696005)(86362001)(2501003)(99286004)(74316002)(7736002)(256004)(52536014)(5660300002)(14444005)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3226;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DWwYonvhR1SGO0DcCiebGKADBOeDFUuU39DMBydPHuexLXRrayU13ie7a70g+fCe6U/9pd4f8+v7shUck26jiVnL+RPCIdLsnHctFP+QjS5+O35WVqFHYj1ladCjC9yXOtdue7f8e1F1uXKAq8SUnAzCcnLGqRCzYvzalqfsd3gpqhRztGG/hQaiR47lseXBxPW4jLdmcGgufWFMFlWf+Hs1mi4SnD849Y3e/KBIxdJ8WqAiCaazo5BFvpm6jGWIodN7wISHGYvVYe4wZxBuo6sjBYchgLPK2K7x9h5JJR1bOZpIwMy6whfooCfzmmmiFRs1tqYi3mtN1WQlBP/plcyybl5MK1r2SE2luyiAGkSJ2dwEh0Nu67Tu641w0X2deooKycE/yG81hJiKY5tcBr7rNrWpyTblF8elIb24iJubGKCNSeZVJGHvjTW+JXUNUQOmOzcz94gUjSCmja0gVQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc823754-94f5-4d88-9f89-08d7422fa5e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 03:14:30.8775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vhtSBc+5gM4reFwifkkJ4QH+28jHL/Jvv/JJbTx31pRHePabXEuUphC62vOGpUtz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3226
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OcdxA5yu3OMooav5nXh+/ut/Gn8/6Sp5oTv3PCuJgc=;
 b=yGN9MacTHnCV8CqtvzH32TUbX1ABl9aT9VIVaoA3q4rAAOTeQY4lHKJcXdL5Tpmbu2hGsD8/u/0nlLYverSdhr2CqZ4IVtW6CKYgzbc4im/CtNqBsE694bYWnymnUOoy+syr/5ImDZv9EpPLFDPo5Kj2CqLD1geeS65zAQ0/Vv8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0986014015=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0986014015==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB27781E9620850E578BB5BA0AF0860DM6PR12MB2778namp_"

--_000_DM6PR12MB27781E9620850E578BB5BA0AF0860DM6PR12MB2778namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Yong Zhao <Yong.Zhao@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Cornwall=
, Jay <Jay.Cornwall@amd.com>
Sent: Wednesday, September 25, 2019 6:06 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Cornwall, Jay <Jay.Cornwall@amd.com>
Subject: [PATCH] drm/amdkfd: Fix race in gfx10 context restore handler

Missing synchronization with VGPR restore leads to intermittent
VGPR trashing in the user shader.

Signed-off-by: Jay Cornwall <jay.cornwall@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 139 +++++++++++------=
----
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |   1 +
 2 files changed, 71 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h b/drivers/gpu/d=
rm/amd/amdkfd/cwsr_trap_handler.h
index 901fe35..d3400da 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
@@ -905,7 +905,7 @@ static const uint32_t cwsr_trap_gfx10_hex[] =3D {
         0x7a5d0000, 0x807c817c,
         0x807aff7a, 0x00000080,
         0xbf0a717c, 0xbf85fff8,
-       0xbf820141, 0xbef4037e,
+       0xbf820142, 0xbef4037e,
         0x8775ff7f, 0x0000ffff,
         0x8875ff75, 0x00040000,
         0xbef60380, 0xbef703ff,
@@ -967,7 +967,7 @@ static const uint32_t cwsr_trap_gfx10_hex[] =3D {
         0x725d0000, 0xe0304080,
         0x725d0100, 0xe0304100,
         0x725d0200, 0xe0304180,
-       0x725d0300, 0xbf820031,
+       0x725d0300, 0xbf820032,
         0xbef603ff, 0x01000000,
         0xbef20378, 0x8078ff78,
         0x00000400, 0xbefc0384,
@@ -992,83 +992,84 @@ static const uint32_t cwsr_trap_gfx10_hex[] =3D {
         0x725d0000, 0xe0304100,
         0x725d0100, 0xe0304200,
         0x725d0200, 0xe0304300,
-       0x725d0300, 0xb9782a05,
-       0x80788178, 0x907c9973,
-       0x877c817c, 0xbf06817c,
-       0xbf850002, 0x8f788978,
-       0xbf820001, 0x8f788a78,
-       0xb9721e06, 0x8f728a72,
-       0x80787278, 0x8078ff78,
-       0x00000200, 0x80f8ff78,
-       0x00000050, 0xbef603ff,
-       0x01000000, 0xbefc03ff,
-       0x0000006c, 0x80f89078,
-       0xf429003a, 0xf0000000,
-       0xbf8cc07f, 0x80fc847c,
-       0xbf800000, 0xbe803100,
-       0xbe823102, 0x80f8a078,
-       0xf42d003a, 0xf0000000,
-       0xbf8cc07f, 0x80fc887c,
-       0xbf800000, 0xbe803100,
-       0xbe823102, 0xbe843104,
-       0xbe863106, 0x80f8c078,
-       0xf431003a, 0xf0000000,
-       0xbf8cc07f, 0x80fc907c,
-       0xbf800000, 0xbe803100,
-       0xbe823102, 0xbe843104,
-       0xbe863106, 0xbe883108,
-       0xbe8a310a, 0xbe8c310c,
-       0xbe8e310e, 0xbf06807c,
-       0xbf84fff0, 0xb9782a05,
-       0x80788178, 0x907c9973,
-       0x877c817c, 0xbf06817c,
-       0xbf850002, 0x8f788978,
-       0xbf820001, 0x8f788a78,
-       0xb9721e06, 0x8f728a72,
-       0x80787278, 0x8078ff78,
-       0x00000200, 0xbef603ff,
-       0x01000000, 0xf4211bfa,
+       0x725d0300, 0xbf8c3f70,
+       0xb9782a05, 0x80788178,
+       0x907c9973, 0x877c817c,
+       0xbf06817c, 0xbf850002,
+       0x8f788978, 0xbf820001,
+       0x8f788a78, 0xb9721e06,
+       0x8f728a72, 0x80787278,
+       0x8078ff78, 0x00000200,
+       0x80f8ff78, 0x00000050,
+       0xbef603ff, 0x01000000,
+       0xbefc03ff, 0x0000006c,
+       0x80f89078, 0xf429003a,
+       0xf0000000, 0xbf8cc07f,
+       0x80fc847c, 0xbf800000,
+       0xbe803100, 0xbe823102,
+       0x80f8a078, 0xf42d003a,
+       0xf0000000, 0xbf8cc07f,
+       0x80fc887c, 0xbf800000,
+       0xbe803100, 0xbe823102,
+       0xbe843104, 0xbe863106,
+       0x80f8c078, 0xf431003a,
+       0xf0000000, 0xbf8cc07f,
+       0x80fc907c, 0xbf800000,
+       0xbe803100, 0xbe823102,
+       0xbe843104, 0xbe863106,
+       0xbe883108, 0xbe8a310a,
+       0xbe8c310c, 0xbe8e310e,
+       0xbf06807c, 0xbf84fff0,
+       0xb9782a05, 0x80788178,
+       0x907c9973, 0x877c817c,
+       0xbf06817c, 0xbf850002,
+       0x8f788978, 0xbf820001,
+       0x8f788a78, 0xb9721e06,
+       0x8f728a72, 0x80787278,
+       0x8078ff78, 0x00000200,
+       0xbef603ff, 0x01000000,
+       0xf4211bfa, 0xf0000000,
+       0x80788478, 0xf4211b3a,
         0xf0000000, 0x80788478,
-       0xf4211b3a, 0xf0000000,
-       0x80788478, 0xf4211b7a,
+       0xf4211b7a, 0xf0000000,
+       0x80788478, 0xf4211eba,
         0xf0000000, 0x80788478,
-       0xf4211eba, 0xf0000000,
-       0x80788478, 0xf4211efa,
+       0xf4211efa, 0xf0000000,
+       0x80788478, 0xf4211c3a,
         0xf0000000, 0x80788478,
-       0xf4211c3a, 0xf0000000,
-       0x80788478, 0xf4211c7a,
+       0xf4211c7a, 0xf0000000,
+       0x80788478, 0xf4211e7a,
         0xf0000000, 0x80788478,
-       0xf4211e7a, 0xf0000000,
-       0x80788478, 0xf4211cfa,
+       0xf4211cfa, 0xf0000000,
+       0x80788478, 0xf4211bba,
         0xf0000000, 0x80788478,
+       0xbf8cc07f, 0xb9eef814,
         0xf4211bba, 0xf0000000,
         0x80788478, 0xbf8cc07f,
-       0xb9eef814, 0xf4211bba,
-       0xf0000000, 0x80788478,
-       0xbf8cc07f, 0xb9eef815,
-       0xbef2036d, 0x876dff72,
-       0x0000ffff, 0xbefc036f,
-       0xbefe037a, 0xbeff037b,
-       0x876f71ff, 0x000003ff,
-       0xb9ef4803, 0xb9f9f816,
-       0x876f71ff, 0xfffff800,
-       0x906f8b6f, 0xb9efa2c3,
-       0xb9f3f801, 0x876fff72,
-       0xfc000000, 0x906f9a6f,
-       0x8f6f906f, 0xbef30380,
+       0xb9eef815, 0xbef2036d,
+       0x876dff72, 0x0000ffff,
+       0xbefc036f, 0xbefe037a,
+       0xbeff037b, 0x876f71ff,
+       0x000003ff, 0xb9ef4803,
+       0xb9f9f816, 0x876f71ff,
+       0xfffff800, 0x906f8b6f,
+       0xb9efa2c3, 0xb9f3f801,
+       0x876fff72, 0xfc000000,
+       0x906f9a6f, 0x8f6f906f,
+       0xbef30380, 0x88736f73,
+       0x876fff72, 0x02000000,
+       0x906f996f, 0x8f6f8f6f,
         0x88736f73, 0x876fff72,
-       0x02000000, 0x906f996f,
-       0x8f6f8f6f, 0x88736f73,
-       0x876fff72, 0x01000000,
-       0x906f986f, 0x8f6f996f,
-       0x88736f73, 0x876fff70,
-       0x00800000, 0x906f976f,
-       0xb9f3f807, 0x87fe7e7e,
-       0x87ea6a6a, 0xb9f0f802,
-       0xbf8a0000, 0xbe80226c,
-       0xbf810000, 0xbf9f0000,
+       0x01000000, 0x906f986f,
+       0x8f6f996f, 0x88736f73,
+       0x876fff70, 0x00800000,
+       0x906f976f, 0xb9f3f807,
+       0x87fe7e7e, 0x87ea6a6a,
+       0xb9f0f802, 0xbf8a0000,
+       0xbe80226c, 0xbf810000,
         0xbf9f0000, 0xbf9f0000,
         0xbf9f0000, 0xbf9f0000,
+       0xbf9f0000, 0x00000000,
 };
 static const uint32_t cwsr_trap_arcturus_hex[] =3D {
         0xbf820001, 0xbf8202c4,
diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm b/drive=
rs/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
index cdaa523..4433bda 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
@@ -758,6 +758,7 @@ L_RESTORE_V0:
         buffer_load_dword       v1, v0, s_restore_buf_rsrc0, s_restore_mem=
_offset_save slc:1 glc:1 offset:256
         buffer_load_dword       v2, v0, s_restore_buf_rsrc0, s_restore_mem=
_offset_save slc:1 glc:1 offset:256*2
         buffer_load_dword       v3, v0, s_restore_buf_rsrc0, s_restore_mem=
_offset_save slc:1 glc:1 offset:256*3
+       s_waitcnt       vmcnt(0)

         /* restore SGPRs */
         //will be 2+8+16*6
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM6PR12MB27781E9620850E578BB5BA0AF0860DM6PR12MB2778namp_
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
Reviewed-by: Yong Zhao &lt;Yong.Zhao@amd.com&gt;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Cornwall, Jay &lt;Jay.Cornwal=
l@amd.com&gt;<br>
<b>Sent:</b> Wednesday, September 25, 2019 6:06 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Cornwall, Jay &lt;Jay.Cornwall@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdkfd: Fix race in gfx10 context restore handl=
er</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Missing synchronization with VGPR restore leads to=
 intermittent<br>
VGPR trashing in the user shader.<br>
<br>
Signed-off-by: Jay Cornwall &lt;jay.cornwall@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h&nbsp;&nbsp;&nbsp;&nbsp=
; | 139 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----------<b=
r>
&nbsp;.../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |&nbsp;&nbsp; 1 &#=
43;<br>
&nbsp;2 files changed, 71 insertions(&#43;), 69 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h b/drivers/gpu/d=
rm/amd/amdkfd/cwsr_trap_handler.h<br>
index 901fe35..d3400da 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h<br>
@@ -905,7 &#43;905,7 @@ static const uint32_t cwsr_trap_gfx10_hex[] =3D {<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x7a5d0000, 0x807c817c,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x807aff7a, 0x00000080,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf0a717c, 0xbf85fff8,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf820141, 0xbef4037e,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf820142, 0xbef4037e,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8775ff7f, 0x0000ffff,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8875ff75, 0x00040000,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbef60380, 0xbef703ff,<br=
>
@@ -967,7 &#43;967,7 @@ static const uint32_t cwsr_trap_gfx10_hex[] =3D {<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x725d0000, 0xe0304080,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x725d0100, 0xe0304100,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x725d0200, 0xe0304180,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x725d0300, 0xbf820031,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x725d0300, 0xbf820032,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbef603ff, 0x01000000,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbef20378, 0x8078ff78,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000400, 0xbefc0384,<br=
>
@@ -992,83 &#43;992,84 @@ static const uint32_t cwsr_trap_gfx10_hex[] =3D {=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x725d0000, 0xe0304100,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x725d0100, 0xe0304200,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x725d0200, 0xe0304300,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x725d0300, 0xb9782a05,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80788178, 0x907c9973,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x877c817c, 0xbf06817c,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf850002, 0x8f788978,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf820001, 0x8f788a78,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xb9721e06, 0x8f728a72,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80787278, 0x8078ff78,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000200, 0x80f8ff78,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000050, 0xbef603ff,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x01000000, 0xbefc03ff,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000006c, 0x80f89078,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf429003a, 0xf0000000,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf8cc07f, 0x80fc847c,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf800000, 0xbe803100,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe823102, 0x80f8a078,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf42d003a, 0xf0000000,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf8cc07f, 0x80fc887c,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf800000, 0xbe803100,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe823102, 0xbe843104,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe863106, 0x80f8c078,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf431003a, 0xf0000000,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf8cc07f, 0x80fc907c,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf800000, 0xbe803100,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe823102, 0xbe843104,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe863106, 0xbe883108,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe8a310a, 0xbe8c310c,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe8e310e, 0xbf06807c,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf84fff0, 0xb9782a05,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80788178, 0x907c9973,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x877c817c, 0xbf06817c,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf850002, 0x8f788978,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf820001, 0x8f788a78,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xb9721e06, 0x8f728a72,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80787278, 0x8078ff78,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000200, 0xbef603ff,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x01000000, 0xf4211bfa,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x725d0300, 0xbf8c3f70,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xb9782a05, 0x80788178,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x907c9973, 0x877c817c,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf06817c, 0xbf850002,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8f788978, 0xbf820001,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8f788a78, 0xb9721e06,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8f728a72, 0x80787278,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8078ff78, 0x00000200,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80f8ff78, 0x00000050,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbef603ff, 0x01000000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbefc03ff, 0x0000006c,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80f89078, 0xf429003a,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf0000000, 0xbf8cc07f,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80fc847c, 0xbf800000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe803100, 0xbe823102,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80f8a078, 0xf42d003a,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf0000000, 0xbf8cc07f,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80fc887c, 0xbf800000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe803100, 0xbe823102,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe843104, 0xbe863106,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80f8c078, 0xf431003a,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf0000000, 0xbf8cc07f,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80fc907c, 0xbf800000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe803100, 0xbe823102,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe843104, 0xbe863106,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe883108, 0xbe8a310a,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe8c310c, 0xbe8e310e,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf06807c, 0xbf84fff0,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xb9782a05, 0x80788178,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x907c9973, 0x877c817c,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf06817c, 0xbf850002,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8f788978, 0xbf820001,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8f788a78, 0xb9721e06,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8f728a72, 0x80787278,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8078ff78, 0x00000200,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbef603ff, 0x01000000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf4211bfa, 0xf0000000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80788478, 0xf4211b3a,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf0000000, 0x80788478,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf4211b3a, 0xf0000000,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80788478, 0xf4211b7a,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf4211b7a, 0xf0000000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80788478, 0xf4211eba,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf0000000, 0x80788478,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf4211eba, 0xf0000000,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80788478, 0xf4211efa,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf4211efa, 0xf0000000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80788478, 0xf4211c3a,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf0000000, 0x80788478,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf4211c3a, 0xf0000000,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80788478, 0xf4211c7a,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf4211c7a, 0xf0000000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80788478, 0xf4211e7a,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf0000000, 0x80788478,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf4211e7a, 0xf0000000,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80788478, 0xf4211cfa,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf4211cfa, 0xf0000000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80788478, 0xf4211bba,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf0000000, 0x80788478,<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf8cc07f, 0xb9eef814,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf4211bba, 0xf0000000,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x80788478, 0xbf8cc07f,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xb9eef814, 0xf4211bba,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xf0000000, 0x80788478,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf8cc07f, 0xb9eef815,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbef2036d, 0x876dff72,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000ffff, 0xbefc036f,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbefe037a, 0xbeff037b,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x876f71ff, 0x000003ff,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xb9ef4803, 0xb9f9f816,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x876f71ff, 0xfffff800,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x906f8b6f, 0xb9efa2c3,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xb9f3f801, 0x876fff72,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xfc000000, 0x906f9a6f,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8f6f906f, 0xbef30380,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xb9eef815, 0xbef2036d,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x876dff72, 0x0000ffff,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbefc036f, 0xbefe037a,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbeff037b, 0x876f71ff,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x000003ff, 0xb9ef4803,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xb9f9f816, 0x876f71ff,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xfffff800, 0x906f8b6f,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xb9efa2c3, 0xb9f3f801,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x876fff72, 0xfc000000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x906f9a6f, 0x8f6f906f,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbef30380, 0x88736f73,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x876fff72, 0x02000000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x906f996f, 0x8f6f8f6f,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x88736f73, 0x876fff72,<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x02000000, 0x906f996f,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8f6f8f6f, 0x88736f73,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x876fff72, 0x01000000,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x906f986f, 0x8f6f996f,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x88736f73, 0x876fff70,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00800000, 0x906f976f,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xb9f3f807, 0x87fe7e7e,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x87ea6a6a, 0xb9f0f802,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf8a0000, 0xbe80226c,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf810000, 0xbf9f0000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x01000000, 0x906f986f,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8f6f996f, 0x88736f73,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x876fff70, 0x00800000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x906f976f, 0xb9f3f807,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x87fe7e7e, 0x87ea6a6a,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xb9f0f802, 0xbf8a0000,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbe80226c, 0xbf810000,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf9f0000, 0xbf9f0000,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf9f0000, 0xbf9f0000,<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf9f0000, 0x00000000,<br>
&nbsp;};<br>
&nbsp;static const uint32_t cwsr_trap_arcturus_hex[] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xbf820001, 0xbf8202c4,<br=
>
diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm b/drive=
rs/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm<br>
index cdaa523..4433bda 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm<br=
>
@@ -758,6 &#43;758,7 @@ L_RESTORE_V0:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buffer_load_dword&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; v1, v0, s_restore_buf_rsrc0, s_restore_mem_offs=
et_save slc:1 glc:1 offset:256<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buffer_load_dword&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; v2, v0, s_restore_buf_rsrc0, s_restore_mem_offs=
et_save slc:1 glc:1 offset:256*2<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buffer_load_dword&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; v3, v0, s_restore_buf_rsrc0, s_restore_mem_offs=
et_save slc:1 glc:1 offset:256*3<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s_waitcnt&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; vmcnt(0)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* restore SGPRs */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //will be 2&#43;8&#43;16*6=
<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB27781E9620850E578BB5BA0AF0860DM6PR12MB2778namp_--

--===============0986014015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0986014015==--
