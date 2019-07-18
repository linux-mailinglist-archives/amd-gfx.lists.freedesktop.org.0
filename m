Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFEB6D161
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 17:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCBC6E415;
	Thu, 18 Jul 2019 15:50:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750058.outbound.protection.outlook.com [40.107.75.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FD46E415
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 15:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ba7ftKhnzh4i5S0vamCp5BUXtwe+pW7+wbNpeWRGBtgkcIRRcO039F1k1S1JjBMdEHD/ubuP77R1zAFlaKu8Aa6ZalEQWekI+C+nBWQd/sU+uKWGOTEkaBXNljzVw30B5EsmPE1FerSnWsBWSvi+YVFAx28YtS3GNmnCmo6N2xenhZbIc0QwLZVt43ZlaPZZrRgOoQiO1PrMKkBF1c3VBVsognuV4qkgnSl+r2GNfknlhAgDZYiXfI0gRR44Uh9zvsfMWFOEwzZ9AQrDMU8RuYH82f87YBh/vhON5AX9b4J2umsScD2FxRAk+WRlJ+24zZe5Q62pm8iGphr/Lc5cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKSZo4w2K+RlgQFjRTLHfRN94cwKZveZceJvNLhssh0=;
 b=j3jt1SouqVhWY4Z2g4201WTKs6UusetEkDgWGnAkX5BGsPj1Ucs2EM4+BPXbo9NQtfDBK7n5gearWNu5tZFJy2+zPbdRD75ZLvVCCcAHTuf4HgX8MfGdM1PJCsPxWTw25rfLcRSN86QIMj1lz71N1HINd17L2tumJfdNt2a517b+qre8K8lQA7XUpaeNo83r+4GXFqRIasM3a9jCQ2gMQALJArxhQVQ3bMUdiR9d8Hb7WUYhuQkSNq+YTxiTwNTCGNh7giwyHzxqbzuDQWVS9rStTf19cLhxnQfkCXeZIiQ3Y0/xTNbdjYKPJ0umqhcSe5uHneA404mI3qgNAyUnTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB2454.namprd12.prod.outlook.com (52.132.141.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 15:49:57 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2%5]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 15:49:57 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: use VCN firmware offset for cache window
Thread-Topic: [PATCH] drm/amdgpu: use VCN firmware offset for cache window
Thread-Index: AQHVPYBz0WLQFyXr9Uu9U/fPBVdzfg==
Date: Thu, 18 Jul 2019 15:49:57 +0000
Message-ID: <20190718154945.15004-1-leo.liu@amd.com>
References: <20190718154616.14841-1-leo.liu@amd.com>
In-Reply-To: <20190718154616.14841-1-leo.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47)
 To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ed027a5-9809-432c-bb78-08d70b979575
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2454; 
x-ms-traffictypediagnostic: DM5PR12MB2454:
x-microsoft-antispam-prvs: <DM5PR12MB245449B570674B6F6D7CE460E5C80@DM5PR12MB2454.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(199004)(189003)(53936002)(6506007)(4326008)(6486002)(6116002)(50226002)(76176011)(6916009)(256004)(7736002)(1076003)(8936002)(52116002)(8676002)(102836004)(86362001)(68736007)(25786009)(486006)(5640700003)(2351001)(478600001)(316002)(6512007)(446003)(66476007)(476003)(11346002)(305945005)(36756003)(186003)(6436002)(26005)(386003)(2906002)(2616005)(4744005)(81156014)(99286004)(71190400001)(14454004)(71200400001)(66066001)(66446008)(66946007)(3846002)(2501003)(81166006)(5660300002)(66556008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2454;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I/5rGo4S6II/G17niLHZ52w1ZdQ8CUfUucsgrV28wNT4a0qlqCorPtQL6BKgQo1ybEKta/PcDnaKXVFLT30rLqNgUlTe9zqGfkGtnE2Rlz+zKtfMksaaT6OSeDSt5wTMmeCV+/IQUGDpIhXj9q0N/kwo7epy09xK+H0xQfxt0kMBhNMvcN2zkXVRqCJEkWGjpvRmzRJHqrGL5D3NF6K4qAbcZfxLx3gRTyVMmtDu8m+YH13qMlvShhvzntID49jk+bmvczzsVsUeXs+i5ncqIrLtBPGTGHueVchj442S/nI+QL06ce1MRVGcFmS41S5W4vph4hi4TPkk9K78NXdJCb6kucxz3IdD3Kvw2nce6D6qEaKm/sExLLlSCYIH1kYtHLFP9O6voS2mbfdIj/ug6QvED/A9C2NiHinHbLuDquE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed027a5-9809-432c-bb78-08d70b979575
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:49:57.3591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoliu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKSZo4w2K+RlgQFjRTLHfRN94cwKZveZceJvNLhssh0=;
 b=y4Rg5Id86lbiE25lXpwI9FdJ4RM3FM/Dv6DgVdMqEyMc0PtnR8ssq8ZRwOEGi99LEvV7H/hnkyqhAh0jGo0gzWlkFY0szk3sHRaG4PHiEyjDcbbCOb8BtbbkM2c0fBvHHBWJ4qHkgc4gangODrCVTaRmtT9EC2F/0Lzglz6oQz0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
Cc: "Liu, Leo" <Leo.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2luY2Ugd2UgYXJlIHVzaW5nIHRoZSBzaWduZWQgRlcgbm93LCBhbmQgYWxzbyB1c2luZyBQU1Ag
ZmlybXdhcmUgbG9hZGluZywKYnV0IGl0J3Mgc3RpbGwgcG90ZW50aWFsIHRvIGJyZWFrIGRyaXZl
ciB3aGVuIGxvYWRpbmcgRlcgZGlyZWN0bHkKaW5zdGVhZCBvZiBQU1AsIHNvIHdlIHNob3VsZCBh
ZGQgb2Zmc2V0LgoKU2lnbmVkLW9mZi1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgfCAzIC0tLQogMSBmaWxlIGNo
YW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmNuX3YyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMK
aW5kZXggM2NiNjJlNDQ4YTM3Li44OGUzZGVkY2Y5MjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3YyXzAuYwpAQCAtMzc5LDExICszNzksOCBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfMF9t
Y19yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCVdSRUczMl9TT0MxNShVVkQs
IDAsIG1tVVZEX0xNSV9WQ1BVX0NBQ0hFXzY0QklUX0JBUl9ISUdILAogCQkJdXBwZXJfMzJfYml0
cyhhZGV2LT52Y24uaW5zdC0+Z3B1X2FkZHIpKTsKIAkJb2Zmc2V0ID0gc2l6ZTsKLQkJLyogTm8g
c2lnbmVkIGhlYWRlciBmb3Igbm93IGZyb20gZmlybXdhcmUKIAkJV1JFRzMyX1NPQzE1KFVWRCwg
MCwgbW1VVkRfVkNQVV9DQUNIRV9PRkZTRVQwLAogCQkJQU1ER1BVX1VWRF9GSVJNV0FSRV9PRkZT
RVQgPj4gMyk7Ci0JCSovCi0JCVdSRUczMl9TT0MxNShVVkQsIDAsIG1tVVZEX1ZDUFVfQ0FDSEVf
T0ZGU0VUMCwgMCk7CiAJfQogCiAJV1JFRzMyX1NPQzE1KFVWRCwgMCwgbW1VVkRfVkNQVV9DQUNI
RV9TSVpFMCwgc2l6ZSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
