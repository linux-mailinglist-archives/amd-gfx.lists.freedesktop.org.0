Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8275847D
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 16:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7546E4CD;
	Thu, 27 Jun 2019 14:31:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760054.outbound.protection.outlook.com [40.107.76.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101C56E4B7
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 14:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=ef0hrcJT16nUZAcXl7Z6Ad3lKVVixdnJtY8GOmsMV1bdCTxTmweeozmBmxKR546/XZ+34YQd7zPDdGPAPZkh4A7aKscX9vZonMuEKwuyUgACc5ACCPTUXH/qyB+iHc7zmbcmfho6sR+S0mJ5tR65qZ6v9RJaFUU3lKpQ/h0EsWI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wswpbCP6gjfDnHfhNKy/kj8pJh20wGIgDK1cC3UD5Oo=;
 b=FEoCZiqBH9QDReapQ8lfypq0lPrMik0g4BWMAVgFpYW99gnBC46p06Kagog1nMadSOKPUgyJKQhz9xVKLxoX5DLY0u6T3BSnGLwLNvfxj7DQIJeB+EfrU/TvaIxGUdSwjPBtyPA8V2tkVl21piV3qECi+cG3kUZqOBLMRSHxwyA=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2376.namprd12.prod.outlook.com (52.132.141.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 14:31:18 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa%9]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 14:31:18 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: drop copy/paste leftover to fix big endian
Thread-Topic: [PATCH] drm/amdgpu: drop copy/paste leftover to fix big endian
Thread-Index: AQHVLPLzZkI9PyeAk0mC/OarJGQpaaavjz9g
Date: Thu, 27 Jun 2019 14:31:18 +0000
Message-ID: <DM5PR12MB1418A3ED7DAED5048E041560FCFD0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190627141628.7882-1-alexander.deucher@amd.com>
In-Reply-To: <20190627141628.7882-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cd33ac7-6791-430c-a032-08d6fb0c1e7a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2376; 
x-ms-traffictypediagnostic: DM5PR12MB2376:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB2376F84D47FADF312A81E4F5FCFD0@DM5PR12MB2376.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:428;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(136003)(346002)(376002)(396003)(13464003)(199004)(189003)(76176011)(53936002)(3846002)(7696005)(25786009)(4326008)(6116002)(52536014)(110136005)(478600001)(8676002)(81166006)(5660300002)(966005)(8936002)(72206003)(102836004)(53546011)(14454004)(81156014)(316002)(68736007)(6506007)(6246003)(2906002)(66476007)(66556008)(66446008)(64756008)(305945005)(476003)(86362001)(66946007)(71190400001)(9686003)(73956011)(76116006)(486006)(6306002)(186003)(74316002)(229853002)(99286004)(55016002)(6436002)(2501003)(256004)(33656002)(14444005)(26005)(11346002)(71200400001)(446003)(7736002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2376;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9qsBK0bew6WFwC9zZslXPZpkCNOJEuuMLdIS1Zzn9ZsrDlOD59sqFFD+nRLMBvJuYGldD0ae+Pi4k+nXUSRO685azG19tEpORKxHt2yAKP+bBheQTM4EL39NuDW1FvUcwoMBIg9UsQzhSvU1jOt0j9fgDhIMABesjaqH5eOpUt2p2X+V2cNC22G454W74edvH5qaVqhc0vVCv4giomtQSLuSsmoGFN6+oK1Z1wMvjtDtSkanY5DrvHvkxHsalXwUdt1Oz1Ejsm/dgleDXnhfSaaxdcByrnGM/zXJoHtoiTYhglzLruM2wp3IJGTXASY97bFajsP00WZN9ALT96FSCY8+HJQF3iKoTTkjfBTJNIpiSBy4cIB8BMrxShHr93A9yGWF7wBIrPDGVVRIvx9j1IL5YuwcCqctDBv34zNOrZk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd33ac7-6791-430c-a032-08d6fb0c1e7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 14:31:18.8095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2376
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wswpbCP6gjfDnHfhNKy/kj8pJh20wGIgDK1cC3UD5Oo=;
 b=RUTPOjH6y9wZRmWDfl8cJ6IyjU/2rrqa1ms7bFRSn3OosxcRd+Nc73bg4XWA7jKtvpI60F5koahbqk1PcxdvPF5nylEbHN48DLehz2CFccQZeLVzdfoXp5+n1k0F+PD96QgmXbE9lDwszN6eHbhnrIyE8T+Opz0aknl7OJlCve4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxl
eCBEZXVjaGVyDQpTZW50OiAyMDE55bm0NuaciDI35pelIDIyOjE2DQpUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IGRyb3AgY29weS9wYXN0
ZSBsZWZ0b3ZlciB0byBmaXggYmlnIGVuZGlhbg0KDQpUaGUgYnVmIHN3YXAgZmllbGQgZG9lc24n
dCBleGlzdCBvbiBSQjEuDQoNClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
MTBfMC5jIHwgMyAtLS0NCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCmluZGV4IDAwNjFhMGU4YWI3OC4uMjkzMmFk
ZTdkYmQwIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8w
LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jDQpAQCAtMjYy
NCw5ICsyNjI0LDYgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfY3BfZ2Z4X3Jlc3VtZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikNCiAJcmJfYnVmc3ogPSBvcmRlcl9iYXNlXzIocmluZy0+cmlu
Z19zaXplIC8gOCk7DQogCXRtcCA9IFJFR19TRVRfRklFTEQoMCwgQ1BfUkIxX0NOVEwsIFJCX0JV
RlNaLCByYl9idWZzeik7DQogCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBDUF9SQjFfQ05UTCwg
UkJfQkxLU1osIHJiX2J1ZnN6IC0gMik7IC0jaWZkZWYgX19CSUdfRU5ESUFODQotCXRtcCA9IFJF
R19TRVRfRklFTEQodG1wLCBDUF9SQjFfQ05UTCwgQlVGX1NXQVAsIDEpOw0KLSNlbmRpZg0KIAlX
UkVHMzJfU09DMTUoR0MsIDAsIG1tQ1BfUkIxX0NOVEwsIHRtcCk7DQogCS8qIEluaXRpYWxpemUg
dGhlIHJpbmcgYnVmZmVyJ3Mgd3JpdGUgcG9pbnRlcnMgKi8NCiAJcmluZy0+d3B0ciA9IDA7DQot
LQ0KMi4yMC4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
