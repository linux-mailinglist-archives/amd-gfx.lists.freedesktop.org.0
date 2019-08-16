Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECFA8F96F
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 05:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71366EAB0;
	Fri, 16 Aug 2019 03:27:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730044.outbound.protection.outlook.com [40.107.73.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD6D6EAB0
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 03:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EecfTxpvzekaTKf+wGWwcp8v5vlHUuPb6JE6aauZrhRGY5IamF5IiE/lEnDYXbZSx3bs8e7fRPsdpwgJ0RY6A6GVH+C9cDt/ggCE7P3J+oJfoRDIU4paDYP2wQoJHCW1QZoMZpEjheZAsA6hjBWsDld3zyheiorQU7D9aTbDFd3+z3UbSSaPCUsXCH3phZAKav6H14g0VAVC9vgC8t5pcrNFatwms0iDLr7mQPPn1P9LVtwQBeTwf5EjJ/Z29EKbKw4rdPr9Cuc+7kxn0aI/X7WnPaZgGdgkqVcJiLTAqD4gBR3MRX5d74c++cv+hjkLUCjhRPnrU9yRKsOCmQdz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMFC/FuljV5Nzbg+odRpmhq2TSpNLLazyc6rkWEzD+0=;
 b=fBMGm4z11ABS2rAv60fkBbih7xvJnyW4ZLcuO0Fm76mE1klRxXETqlbG27NZ4ZWp2k2QakVBEB+YAUAYB/QUT+ZdhbYwxz+Cd9peEJw1+sJSWIaCaEct/XBgup2l3JWvjauPXo+HxhsRKl96XEIDtKqNECQg5X7jwFtF+BSTkdrX8E1JLI938AcEuuXfsZVu95cIwf6i886c/HIYDGtASx/i2u/WOqhInVD8uWC5NeJdWtFMjOccHNP9cmAI/61Bme3B6VjFzYr5TVm3nkgmRZk/fKBTBcQiyCS/Kluu/EVyRxfiNN9aRWPJKUcB0R95nIU4Xom0W+1PwPIBug2a9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (20.179.80.214) by
 MN2PR12MB3487.namprd12.prod.outlook.com (20.178.241.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Fri, 16 Aug 2019 03:27:39 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::84a7:6d70:2ddc:1d09]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::84a7:6d70:2ddc:1d09%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 03:27:39 +0000
From: "Zhu, Changfeng" <Changfeng.Zhu@amd.com>
To: "Xu, Feifei" <Feifei.Xu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Set no-retry as default.
Thread-Topic: [PATCH] drm/amdgpu: Set no-retry as default.
Thread-Index: AQHVU+G7KT+cxCJg+k2T9obEVrmIRab9HQcQ
Date: Fri, 16 Aug 2019 03:27:39 +0000
Message-ID: <MN2PR12MB2896E30C65B0066C2EF4419CFDAF0@MN2PR12MB2896.namprd12.prod.outlook.com>
References: <20190816032131.3232-1-Feifei.Xu@amd.com>
In-Reply-To: <20190816032131.3232-1-Feifei.Xu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 872d4eef-3bce-441b-fc29-08d721f9b0de
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3487; 
x-ms-traffictypediagnostic: MN2PR12MB3487:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3487E8166B67BBE2DA8768A1FDAF0@MN2PR12MB3487.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:196;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(13464003)(189003)(199004)(53546011)(55016002)(6506007)(76176011)(33656002)(316002)(966005)(53936002)(186003)(102836004)(26005)(54906003)(25786009)(6436002)(256004)(9686003)(4326008)(6306002)(7696005)(110136005)(99286004)(14444005)(66476007)(476003)(11346002)(446003)(8936002)(66446008)(76116006)(8676002)(86362001)(64756008)(66556008)(66946007)(229853002)(66066001)(3846002)(6246003)(71190400001)(74316002)(71200400001)(2501003)(7736002)(14454004)(52536014)(81166006)(2906002)(486006)(6116002)(81156014)(305945005)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3487;
 H:MN2PR12MB2896.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OR4HxW96Xe4FSernIqWZOyqS5et9P/LHg0ren0/0j6SllXJ0Rxd7aIM2vMS7r6MSxqLrYCYGtle5swrxMKBmj6wTQPZcZXIJz3SPp439jrY4EEvVW2kKQArFRRWpUI/nzlry8tQe8NRVxUCUDFc4qFfzc6loT/YknDnDUEpD8pndcPCfpyhwuB/7QSDz4LwCdoHpClK/UjVB0hyFQ3qr4uw8tdojI+l5kFLRqNIDvcnuVK66Xl9BqXd8mqlVQKsSdR+u6vYyKfg7t5AwlfSvpMfw7mDw8f3h+YAM79ACX1cYmSApdUfU+XcOQKb751c5ZM8ImIdKPAJRWv6xGhjVuIJb5zHAbC7NvThl5SDN2t0mQ4jyuiiHmHsEXKQkztLfKRP8D53+eXYE3MzwDO2bGNwiEN+2e8POpiT3uotbCMw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 872d4eef-3bce-441b-fc29-08d721f9b0de
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 03:27:39.2702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QsmkwSUQ62B7RrQHuRDt+Y2sldCFlO4Taoe+CN0rcVlO93YnSxp0GT1jleXi20a1L+eWa9QjpDlXvrpxWKCuVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMFC/FuljV5Nzbg+odRpmhq2TSpNLLazyc6rkWEzD+0=;
 b=FtwMWXp2EM83b0nkASQ5ewInxXGxZedwQDdq2Mekbgk3sqtSzto94upwnwcH6PJnsSq43ERYypttZNKAYelHIbe6NTbtSaySJcAH+v+UBYLtM60JNKAekhdkQJz33Yzry07hk1tRHN5TqaXcM/dH6ICfAG424B+pHD2dxdPZo3k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Changfeng.Zhu@amd.com; 
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Li, Candice" <Candice.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IGNoYW5nemh1IDxDaGFuZ2ZlbmcuWmh1QGFtZC5jb20+DQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgRmVpZmVpIFh1DQpTZW50OiBGcmlkYXksIEF1
Z3VzdCAxNiwgMjAxOSAxMToyMiBBTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQpDYzogWHUsIEZlaWZlaSA8RmVpZmVpLlh1QGFtZC5jb20+OyBMaSwgQ2FuZGljZSA8Q2FuZGlj
ZS5MaUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBTZXQgbm8tcmV0cnkg
YXMgZGVmYXVsdC4NCg0KVGhpcyBpcyB0byBpbXByb3ZlIHBlcmZvcm1hbmNlLg0KDQpTaWduZWQt
b2ZmLWJ5OiBGZWlmZWkgWHUgPEZlaWZlaS5YdUBhbWQuY29tPg0KVGVzdGVkLWJ5OiBDYW5kaWNl
IExpIDxjYW5kaWNlLmxpQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMgfCA0ICsrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
DQppbmRleCAxNTM3MDU4NDhjYzguLjBkZjU0ZDQ1MzY5YyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQpAQCAtMTQ1LDcgKzE0NSw3IEBAIGludCBhbWRncHVfYXN5
bmNfZ2Z4X3JpbmcgPSAxOyAgaW50IGFtZGdwdV9tY2JwID0gMDsgIGludCBhbWRncHVfZGlzY292
ZXJ5ID0gLTE7ICBpbnQgYW1kZ3B1X21lcyA9IDA7IC1pbnQgYW1kZ3B1X25vcmV0cnk7DQoraW50
IGFtZGdwdV9ub3JldHJ5ID0gMTsNCiANCiBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1X2lu
Zm8gPSB7DQogCS5tdXRleCA9IF9fTVVURVhfSU5JVElBTElaRVIobWdwdV9pbmZvLm11dGV4KSwN
CkBAIC02MjEsNyArNjIxLDcgQEAgTU9EVUxFX1BBUk1fREVTQyhtZXMsICBtb2R1bGVfcGFyYW1f
bmFtZWQobWVzLCBhbWRncHVfbWVzLCBpbnQsIDA0NDQpOw0KIA0KIE1PRFVMRV9QQVJNX0RFU0Mo
bm9yZXRyeSwNCi0JIkRpc2FibGUgcmV0cnkgZmF1bHRzICgwID0gcmV0cnkgZW5hYmxlZCAoZGVm
YXVsdCksIDEgPSByZXRyeSBkaXNhYmxlZCkiKTsNCisJIkRpc2FibGUgcmV0cnkgZmF1bHRzICgw
ID0gcmV0cnkgZW5hYmxlZCwgMSA9IHJldHJ5IGRpc2FibGVkIA0KKyhkZWZhdWx0KSkiKTsNCiBt
b2R1bGVfcGFyYW1fbmFtZWQobm9yZXRyeSwgYW1kZ3B1X25vcmV0cnksIGludCwgMDY0NCk7DQog
DQogI2lmZGVmIENPTkZJR19IU0FfQU1EDQotLQ0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
