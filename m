Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0682B34E17
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 18:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43328929B;
	Tue,  4 Jun 2019 16:57:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710051.outbound.protection.outlook.com [40.107.71.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AF68929B
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 16:57:11 +0000 (UTC)
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) by
 CY4PR1201MB0104.namprd12.prod.outlook.com (10.172.78.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Tue, 4 Jun 2019 16:57:09 +0000
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9]) by CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9%8]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 16:57:09 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fixed missing to clear some EDC count
Thread-Topic: [PATCH] drm/amdgpu: Fixed missing to clear some EDC count
Thread-Index: AQHVGvaLoJqmHYkog0iTpLhuSVRx9w==
Date: Tue, 4 Jun 2019 16:57:08 +0000
Message-ID: <1559667415-16936-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::22) To CY4PR1201MB0102.namprd12.prod.outlook.com
 (2603:10b6:910:1b::20)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a959412-4288-4c0a-0e41-08d6e90dae14
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0104; 
x-ms-traffictypediagnostic: CY4PR1201MB0104:
x-microsoft-antispam-prvs: <CY4PR1201MB01046909AC9F5EAFC42BA080E4150@CY4PR1201MB0104.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(396003)(136003)(39860400002)(189003)(199004)(81166006)(26005)(81156014)(6116002)(2351001)(2501003)(186003)(6916009)(4326008)(102836004)(3846002)(8936002)(71200400001)(71190400001)(50226002)(53936002)(54906003)(2906002)(86362001)(316002)(99286004)(14444005)(478600001)(73956011)(8676002)(5660300002)(72206003)(52116002)(6506007)(386003)(2616005)(256004)(36756003)(66446008)(476003)(66946007)(6512007)(5640700003)(6436002)(66556008)(66476007)(64756008)(68736007)(14454004)(66066001)(305945005)(25786009)(6486002)(7736002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0104;
 H:CY4PR1201MB0102.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7uzj8mJwF9OHanqoDFVK6VEY97HpVL5xY7pdKNN2pTHRl1lwCFoLLuA4l1PUY1xdIlwOP0uoHkOffssaqeH2oTIofH3H9HrqkOhxnBis/QmwSubPFozR1MUyy9f1w5Jj4dW7AREmHX2q78+uawnxRvdebIfpB1WFVjWwzT+sjDrFfcxCzafHVS8W5qsVBN0CwA40kgOhTbKsIEBWGiOlEzrWAoeD8wVI0qhiVvAFo1veYEouheaz2M7Aw1VdvKODWykJXRvRKUJEkyw0wiW46ymVT0GGw604cQdg1VYq1s3mdthXPQ+2RfMjlwJg52SsVf1caNaYv2sA56JzuTu5upIICuaWh6ivlQktowLjcLTn7GdmS2omGhbHtgyzh+iuYD9ZbNqp8af+fdcM7xKE35CuoGuEEVPvgDc61Zoj62U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a959412-4288-4c0a-0e41-08d6e90dae14
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 16:57:08.9525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jamesz@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hG++QyF9uG7VYSmgWwDxfT5e+EUYA7+eeTf1K02dONQ=;
 b=iSxCjJH1CVjPnI+3OZyit9ZseBgpMleL3Ak1AzxyRyEp56S9xMq3qpm47Ni6F7Wa8Sr1VnVK8FoEb4jckM9+ZFZUUY1J/0lHxbvCoqP6uE8bx3L+oYBcpFPP2me/LVLK9uiB1j62z+yAvIYu3VQ1AHjrI3SnNBva/zmp2LpkGQU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Gabra, Maroun" <Maroun.Gabra@amd.com>, "Zhu, James" <James.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RURDIGNvdW50cyBhcmUgcmVsYXRlZCB0byBpbnN0YW5jZSBhbmQgc2UuIFRoZXkgYXJlIG5vdCB0
aGUgc2FtZQ0KZm9yIGRpZmZlcmVudCB0eXBlIG9mIEVEQy4gRURDIGNsZWFyaW5nIGFyZSBjaGFu
Z2VkIHRvIGJhc2Ugb24NCmluZGl2aWR1YWwgRURDJ3MgaW5zdGFuY2UgYW5kIFNFIG51bWJlci4N
Cg0KU2lnbmVkLW9mZi1ieTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4NCi0tLQ0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCA4NSArKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1Lmgg
ICAgfCAgMiArDQogMiBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQppbmRleCAyZTljYWMx
Li42MzU2MTg5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5
XzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KQEAgLTM1
ODYsMzcgKzM1ODYsMzggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZW50cnkgc2dw
cl9pbml0X3JlZ3NbXSA9IHsNCiB9Ow0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVn
X2VudHJ5IHNlY19kZWRfY291bnRlcl9yZWdpc3RlcnNbXSA9IHsNCi0gICB7IFNPQzE1X1JFR19F
TlRSWShHQywgMCwgbW1DUENfRURDX1NDUkFUQ0hfQ05UKSB9LA0KLSAgIHsgU09DMTVfUkVHX0VO
VFJZKEdDLCAwLCBtbUNQQ19FRENfVUNPREVfQ05UKSB9LA0KLSAgIHsgU09DMTVfUkVHX0VOVFJZ
KEdDLCAwLCBtbUNQRl9FRENfUk9RX0NOVCkgfSwNCi0gICB7IFNPQzE1X1JFR19FTlRSWShHQywg
MCwgbW1DUEZfRURDX1RBR19DTlQpIH0sDQotICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1t
Q1BHX0VEQ19ETUFfQ05UKSB9LA0KLSAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbUNQR19F
RENfVEFHX0NOVCkgfSwNCi0gICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1EQ19FRENfQ1NJ
TlZPQ19DTlQpIH0sDQotICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tRENfRURDX1JFU1RP
UkVfQ05UKSB9LA0KLSAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbURDX0VEQ19TVEFURV9D
TlQpIH0sDQotICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tR0RTX0VEQ19DTlQpIH0sDQot
ICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tR0RTX0VEQ19HUkJNX0NOVCkgfSwNCi0gICB7
IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1HRFNfRURDX09BX0RFRCkgfSwNCi0gICB7IFNPQzE1
X1JFR19FTlRSWShHQywgMCwgbW1TUElfRURDX0NOVCkgfSwNCi0gICB7IFNPQzE1X1JFR19FTlRS
WShHQywgMCwgbW1TUUNfRURDX0NOVCkgfSwNCi0gICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwg
bW1TUV9FRENfREVEX0NOVCkgfSwNCi0gICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1TUV9F
RENfSU5GTykgfSwNCi0gICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1TUV9FRENfU0VDX0NO
VCkgfSwNCi0gICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1UQ0NfRURDX0NOVCkgfSwNCi0g
ICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1UQ1BfQVRDX0VEQ19HQVRDTDFfQ05UKSB9LA0K
LSAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbVRDUF9FRENfQ05UKSB9LA0KLSAgIHsgU09D
MTVfUkVHX0VOVFJZKEdDLCAwLCBtbVREX0VEQ19DTlQpIH0sDQotICAgeyBTT0MxNV9SRUdfRU5U
UlkoR0MsIDAsIG1tU1FDX0VEQ19DTlQyKSB9LA0KLSAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAw
LCBtbVNRX0VEQ19DTlQpIH0sDQotICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tVEFfRURD
X0NOVCkgfSwNCi0gICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1HRFNfRURDX09BX1BIWV9D
TlQpIH0sDQotICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tR0RTX0VEQ19PQV9QSVBFX0NO
VCkgfSwNCi0gICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1HQ0VBX0VEQ19DTlQpIH0sDQot
ICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tR0NFQV9FRENfQ05UMikgfSwNCi0gICB7IFNP
QzE1X1JFR19FTlRSWShHQywgMCwgbW1UQ0lfRURDX0NOVCkgfSwNCi0gICB7IFNPQzE1X1JFR19F
TlRSWShHQywgMCwgbW1UQ0NfRURDX0NOVDIpIH0sDQotICAgeyBTT0MxNV9SRUdfRU5UUlkoR0Ms
IDAsIG1tVENBX0VEQ19DTlQpIH0sDQorICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tQ1BD
X0VEQ19TQ1JBVENIX0NOVCksIDAsIDEsIDF9LA0KKyAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAw
LCBtbUNQQ19FRENfVUNPREVfQ05UKSwgMCwgMSwgMX0sDQorICAgeyBTT0MxNV9SRUdfRU5UUlko
R0MsIDAsIG1tQ1BGX0VEQ19ST1FfQ05UKSwgMCwgMSwgMX0sDQorICAgeyBTT0MxNV9SRUdfRU5U
UlkoR0MsIDAsIG1tQ1BGX0VEQ19UQUdfQ05UKSwgMCwgMSwgMX0sDQorICAgeyBTT0MxNV9SRUdf
RU5UUlkoR0MsIDAsIG1tQ1BHX0VEQ19ETUFfQ05UKSwgMCwgMSwgMX0sDQorICAgeyBTT0MxNV9S
RUdfRU5UUlkoR0MsIDAsIG1tQ1BHX0VEQ19UQUdfQ05UKSwgMCwgMSwgMX0sDQorICAgeyBTT0Mx
NV9SRUdfRU5UUlkoR0MsIDAsIG1tRENfRURDX0NTSU5WT0NfQ05UKSwgMCwgMSwgMX0sDQorICAg
eyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tRENfRURDX1JFU1RPUkVfQ05UKSwgMCwgMSwgMX0s
DQorICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tRENfRURDX1NUQVRFX0NOVCksIDAsIDEs
IDF9LA0KKyAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbUdEU19FRENfQ05UKSwgMCwgMSwg
MX0sDQorICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tR0RTX0VEQ19HUkJNX0NOVCksIDAs
IDEsIDF9LA0KKyAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbUdEU19FRENfT0FfREVEKSwg
MCwgMSwgMX0sDQorICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tU1BJX0VEQ19DTlQpLCAw
LCA0LCAxfSwNCisgICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1TUUNfRURDX0NOVCksIDAs
IDQsIDZ9LA0KKyAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbVNRX0VEQ19ERURfQ05UKSwg
MCwgNCwgMTZ9LA0KKyAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbVNRX0VEQ19JTkZPKSwg
MCwgNCwgMTZ9LA0KKyAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbVNRX0VEQ19TRUNfQ05U
KSwgMCwgNCwgMTZ9LA0KKyAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbVRDQ19FRENfQ05U
KSwgMCwgMSwgMTZ9LA0KKyAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbVRDUF9BVENfRURD
X0dBVENMMV9DTlQpLCAwLCA0LCAxNn0sDQorICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1t
VENQX0VEQ19DTlQpLCAwLCA0LCAxNn0sDQorICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1t
VERfRURDX0NOVCksIDAsIDQsIDE2fSwNCisgICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1T
UUNfRURDX0NOVDIpLCAwLCA0LCA2fSwNCisgICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1T
UV9FRENfQ05UKSwgMCwgNCwgMTZ9LA0KKyAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbVRB
X0VEQ19DTlQpLCAwLCA0LCAxNn0sDQorICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tR0RT
X0VEQ19PQV9QSFlfQ05UKSwgMCwgMSwgMX0sDQorICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAs
IG1tR0RTX0VEQ19PQV9QSVBFX0NOVCksIDAsIDEsIDF9LA0KKyAgIHsgU09DMTVfUkVHX0VOVFJZ
KEdDLCAwLCBtbUdDRUFfRURDX0NOVCksIDAsIDEsIDMyfSwNCisgICB7IFNPQzE1X1JFR19FTlRS
WShHQywgMCwgbW1HQ0VBX0VEQ19DTlQyKSwgMCwgMSwgMzJ9LA0KKyAgIHsgU09DMTVfUkVHX0VO
VFJZKEdDLCAwLCBtbVRDSV9FRENfQ05UKSwgMCwgMSwgNzJ9LA0KKyAgIHsgU09DMTVfUkVHX0VO
VFJZKEdDLCAwLCBtbVRDQ19FRENfQ05UMiksIDAsIDEsIDE2fSwNCisgICB7IFNPQzE1X1JFR19F
TlRSWShHQywgMCwgbW1UQ0FfRURDX0NOVCksIDAsIDEsIDJ9LA0KKyAgIHsgU09DMTVfUkVHX0VO
VFJZKEdDLCAwLCBtbVNRQ19FRENfQ05UMyksIDAsIDQsIDZ9LA0KIH07DQogDQogc3RhdGljIGlu
dCBnZnhfdjlfMF9kb19lZGNfZ3ByX3dvcmthcm91bmRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQ0KQEAgLTM2MjQsNyArMzYyNSw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZG9fZWRjX2dw
cl93b3JrYXJvdW5kcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nID0gJmFkZXYtPmdmeC5jb21wdXRlX3JpbmdbMF07DQogCXN0cnVjdCBhbWRn
cHVfaWIgaWI7DQogCXN0cnVjdCBkbWFfZmVuY2UgKmYgPSBOVUxMOw0KLQlpbnQgciwgaSwgajsN
CisJaW50IHIsIGksIGosIGs7DQogCXVuc2lnbmVkIHRvdGFsX3NpemUsIHZncHJfb2Zmc2V0LCBz
Z3ByX29mZnNldDsNCiAJdTY0IGdwdV9hZGRyOw0KIA0KQEAgLTM3MzYsMTkgKzM3MzcsMTMgQEAg
c3RhdGljIGludCBnZnhfdjlfMF9kb19lZGNfZ3ByX3dvcmthcm91bmRzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQ0KIA0KIAkvKiByZWFkIGJhY2sgcmVnaXN0ZXJzIHRvIGNsZWFyIHRoZSBj
b3VudGVycyAqLw0KIAltdXRleF9sb2NrKCZhZGV2LT5ncmJtX2lkeF9tdXRleCk7DQotCWZvciAo
aiA9IDA7IGogPCAxNjsgaisrKSB7DQotCQlnZnhfdjlfMF9zZWxlY3Rfc2Vfc2goYWRldiwgMHgw
MSwgMHgwLCBqKTsNCi0JCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNlY19kZWRfY291bnRl
cl9yZWdpc3RlcnMpOyBpKyspDQotCQkJUlJFRzMyKFNPQzE1X1JFR19FTlRSWV9PRkZTRVQoc2Vj
X2RlZF9jb3VudGVyX3JlZ2lzdGVyc1tpXSkpOw0KLQkJZ2Z4X3Y5XzBfc2VsZWN0X3NlX3NoKGFk
ZXYsIDB4MDIsIDB4MCwgaik7DQotCQlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzZWNfZGVk
X2NvdW50ZXJfcmVnaXN0ZXJzKTsgaSsrKQ0KLQkJCVJSRUczMihTT0MxNV9SRUdfRU5UUllfT0ZG
U0VUKHNlY19kZWRfY291bnRlcl9yZWdpc3RlcnNbaV0pKTsNCi0JCWdmeF92OV8wX3NlbGVjdF9z
ZV9zaChhZGV2LCAweDAzLCAweDAsIGopOw0KLQkJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUo
c2VjX2RlZF9jb3VudGVyX3JlZ2lzdGVycyk7IGkrKykNCi0JCQlSUkVHMzIoU09DMTVfUkVHX0VO
VFJZX09GRlNFVChzZWNfZGVkX2NvdW50ZXJfcmVnaXN0ZXJzW2ldKSk7DQotCQlnZnhfdjlfMF9z
ZWxlY3Rfc2Vfc2goYWRldiwgMHgwNCwgMHgwLCBqKTsNCi0JCWZvciAoaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKHNlY19kZWRfY291bnRlcl9yZWdpc3RlcnMpOyBpKyspDQotCQkJUlJFRzMyKFNPQzE1
X1JFR19FTlRSWV9PRkZTRVQoc2VjX2RlZF9jb3VudGVyX3JlZ2lzdGVyc1tpXSkpOw0KKwlmb3Ig
KGkgPSAwOyBpIDwgQVJSQVlfU0laRShzZWNfZGVkX2NvdW50ZXJfcmVnaXN0ZXJzKTsgaSsrKSB7
DQorCQlmb3IgKGogPSAwOyBqIDwgc2VjX2RlZF9jb3VudGVyX3JlZ2lzdGVyc1tpXS5pbnN0YW5j
ZTsgaisrKSB7DQorCQkJZm9yIChrID0gMDsgayA8IHNlY19kZWRfY291bnRlcl9yZWdpc3RlcnNb
aV0uc2VfbnVtOyBrKyspIHsNCisJCQkJZ2Z4X3Y5XzBfc2VsZWN0X3NlX3NoKGFkZXYsIGssIDB4
MCwgaik7DQorCQkJCVJSRUczMihTT0MxNV9SRUdfRU5UUllfT0ZGU0VUKHNlY19kZWRfY291bnRl
cl9yZWdpc3RlcnNbaV0pKTsNCisJCQl9DQorCQl9DQogCX0NCiAJV1JFRzMyX1NPQzE1KEdDLCAw
LCBtbUdSQk1fR0ZYX0lOREVYLCAweGUwMDAwMDAwKTsNCiAJbXV0ZXhfdW5sb2NrKCZhZGV2LT5n
cmJtX2lkeF9tdXRleCk7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c29jMTUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmgNCmluZGV4IDA2ZjM5
ZjUuLjQ4ZTgyNGQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2Mx
NS5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5oDQpAQCAtNDgsNiAr
NDgsOCBAQCBzdHJ1Y3Qgc29jMTVfcmVnX2VudHJ5IHsNCiAJdWludDMyX3Qgc2VnOw0KIAl1aW50
MzJfdCByZWdfb2Zmc2V0Ow0KIAl1aW50MzJfdCByZWdfdmFsdWU7DQorCXVpbnQzMl90IHNlX251
bTsNCisJdWludDMyX3QgaW5zdGFuY2U7DQogfTsNCiANCiAjZGVmaW5lIFNPQzE1X1JFR19FTlRS
WShpcCwgaW5zdCwgcmVnKQlpcCMjX0hXSVAsIGluc3QsIHJlZyMjX0JBU0VfSURYLCByZWcNCi0t
IA0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
