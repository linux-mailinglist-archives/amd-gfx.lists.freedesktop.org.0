Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5944AB45B5
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 04:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7528F6EAC9;
	Tue, 17 Sep 2019 02:57:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750058.outbound.protection.outlook.com [40.107.75.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4916EAC9
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 02:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDgELC/k6gU8yvNT09lHTpMaNtm3Sj7S/Hycz0o8NSKLGcmhXrx2bGCqP/9CCs8OApljdsAfIn2RyxTdQBRkrxG5LbpR6oeQmbKOSH7BNOuhop1PvMzNxl56RFh2bSBG30VDt1mFRpmx9I0mB/JfA4P/sgTYFvH/jpau/EGTh9SGh0tWozXDijAouX5b2McjX+2uK0O9Z+XYU7cOL2orURD0Jrji30EDPBCVDRTiQvpuIWPS8EjXJ7VMGKIX0uLwpbBFFZuYpIcKfk9MVdkML3Oi1UPXo1lpLwLK6Ikg/DtmuSfA7P7TsqsD1LyWfXdwmoGaiJHDK69BnT5tcPFM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KI3Zb138xtkwqpofETE8QV3/C7JQPuPt5w7kEHho68=;
 b=Qcbk6OYB6Eui9JfZ3XKCPfrq+BCXZ0LTOZmRYUdCCgN9ltgqQ4x22ZeIvLfDmetvPja0DyWpKV20spZ7ftJoLcEXKIU2R014CHkZ039NZRQvHaFSA60o/RrLPJOkFwG4qVW2hAKsTXQmdHCfGiErowYZCZBwI3jcTeMfNKAN1Hb+4oit19IJIxifIJu12j3+Ge/rG4eBaqLtsvmHo8IabInqzHvBN34Vi/tcaxZNQbZvLh7QOWFDtgAYAy+W4T8nJr//0bu0mdsuE1g8m+3oS2YEgosYxIwa/EzB5x4phBuTk+OztSWRcWyDRGs5Yu70K08oGYcHtfYGSDhuzecLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1834.namprd12.prod.outlook.com (10.175.87.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Tue, 17 Sep 2019 02:57:48 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 02:57:48 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Xu, Feifei" <Feifei.Xu@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Long,
 Gang" <Gang.Long@amd.com>
Subject: [Patch] drm/amdgpu: add navi12 pci id
Thread-Topic: [Patch] drm/amdgpu: add navi12 pci id
Thread-Index: AQHVbQLpRi6MOO44JEKZbCbq0YcMyA==
Date: Tue, 17 Sep 2019 02:57:48 +0000
Message-ID: <DM5PR12MB253567599A33CBC49F0DFEDD958F0@DM5PR12MB2535.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4d81277-5f48-453c-2705-08d73b1ad272
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR12MB1834; 
x-ms-traffictypediagnostic: DM5PR12MB1834:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1834C0593D287AACF6089174958F0@DM5PR12MB1834.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:118;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(199004)(189003)(52536014)(256004)(64756008)(66446008)(33656002)(66556008)(71200400001)(7736002)(66616009)(110136005)(66066001)(105004)(66946007)(7696005)(2501003)(66476007)(25786009)(476003)(73894004)(71190400001)(102836004)(19627405001)(6636002)(14454004)(6506007)(5660300002)(26005)(99286004)(4270600006)(186003)(6436002)(76116006)(498600001)(91956017)(3846002)(8936002)(99936001)(86362001)(6116002)(55016002)(54896002)(74316002)(9686003)(8676002)(81166006)(81156014)(2906002)(486006)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1834;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BhGrRLs3ipHYCKTTSRaRIGalrvUKEhzSGB0Ln3VfgAcp2ILMjevb0f8EXoAQa8C/z3Z7pHv+llHCPhNX56TpPYsa/bwa7/6L4XevR1Hayn0YKTGQtHiKrbbmoL3NlLZjxVBQKuJkgonzoPXjI4AfmVjh8FRKpm+QjfUlIbkZ++ghovj9VpKK82zgZPmBKdCQI3GG+Fv+Bsz+3w/TZjdvp4iHyRijJEQqXP3vgyLZ+yOfltSIuOHNJM9sel67+3GJmnC5nnU08pnyfH9eVU9hPSss6YFXzCTg24Tu5Im8OFU=
Content-Type: multipart/mixed;
 boundary="_004_DM5PR12MB253567599A33CBC49F0DFEDD958F0DM5PR12MB2535namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d81277-5f48-453c-2705-08d73b1ad272
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 02:57:48.0260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lq89OD/eDJkMy2xAD74j2XLOm5Evh+di5nqa55DcdyfWHLH6KYmytspGHzfm+NNWXxTWjnr4iuXMWa4RVPe8EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1834
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KI3Zb138xtkwqpofETE8QV3/C7JQPuPt5w7kEHho68=;
 b=m55VWVru6cxbYBthaFd13CFJJyykpr+Qu6xQNNqSuxsRk2NDlmzpMTWerf8Jy0nlAJtX4fH2WqVHeiF9z019OIqtx12Z9VlZAq5xdIQvAv6OljosTkmT9ugPOO6ztvFR9W9C2CcHvDhVEOZOztM+ahZUQtqX4IYaIC1W2EFJj1Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tianci.Yin@amd.com; 
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_004_DM5PR12MB253567599A33CBC49F0DFEDD958F0DM5PR12MB2535namp_
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB253567599A33CBC49F0DFEDD958F0DM5PR12MB2535namp_"

--_000_DM5PR12MB253567599A33CBC49F0DFEDD958F0DM5PR12MB2535namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



--_000_DM5PR12MB253567599A33CBC49F0DFEDD958F0DM5PR12MB2535namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_DM5PR12MB253567599A33CBC49F0DFEDD958F0DM5PR12MB2535namp_--

--_004_DM5PR12MB253567599A33CBC49F0DFEDD958F0DM5PR12MB2535namp_
Content-Type: text/x-patch; name="0001-drm-amdgpu-add-navi12-pci-id.patch"
Content-Description: 0001-drm-amdgpu-add-navi12-pci-id.patch
Content-Disposition: attachment;
	filename="0001-drm-amdgpu-add-navi12-pci-id.patch"; size=901;
	creation-date="Tue, 17 Sep 2019 02:52:23 GMT";
	modification-date="Tue, 17 Sep 2019 02:52:23 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlYzBkNGUwMDY5ODc3YTVhNzYzOTcyZGE0MzkzYjNjMTE0MDQxMDhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiVGlhbmNpLllpbiIgPHRpYW5jaS55aW5AYW1kLmNvbT4KRGF0
ZTogVHVlLCAxNyBTZXAgMjAxOSAxMDozNTozNCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGRybS9h
bWRncHU6IGFkZCBuYXZpMTIgcGNpIGlkCgpBZGQgTmF2aTEyIFBDSSBpZCBzdXBwb3J0LgoKQ2hh
bmdlLUlkOiBJYzRlNjNmNDZmNmRkZjg1NjkxMDAxOGRjM2RkYzIwOTNkODc4NzNkMApTaWduZWQt
b2ZmLWJ5OiBUaWFuY2kuWWluIDx0aWFuY2kueWluQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXgg
OGQxY2Y5OC4uNDIwODg4ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
YwpAQCAtMTAzMiw2ICsxMDMyLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lk
IHBjaWlkbGlzdFtdID0gewogCS8qIFJlbm9pciAqLwogCXsweDEwMDIsIDB4MTYzNiwgUENJX0FO
WV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9SRU5PSVJ8QU1EX0lTX0FQVX0sCiAKKwkvKiBO
YXZpMTIgKi8KKwl7MHgxMDAyLCAweDczNjAsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAs
IENISVBfTkFWSTEyfSwKKwogCXswLCAwLCAwfQogfTsKIAotLSAKMi43LjQKCg==

--_004_DM5PR12MB253567599A33CBC49F0DFEDD958F0DM5PR12MB2535namp_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--_004_DM5PR12MB253567599A33CBC49F0DFEDD958F0DM5PR12MB2535namp_--
