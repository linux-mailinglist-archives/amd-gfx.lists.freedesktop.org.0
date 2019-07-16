Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AB26A76E
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 13:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B236E0D5;
	Tue, 16 Jul 2019 11:24:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760057.outbound.protection.outlook.com [40.107.76.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A5C6E0D5
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 11:24:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaBNtsopVO6ZGQvef5vjt4ogdQ6oJ2l9wUe4ULoKAOiXP1g7lzhGI92+mXMqF0no4r7Q91K3hBoChwDrUxzyDHJRCIrxUYrUO1bpF/2Ju7CCwx39HFHigOgtRS2bwKyMeHKcjqDjxS6J00iYqwKDovHpB+xoPCzWRJvFwJ0dxHHuBoCR1RQ2c7m3jRuwN2QRXT2IDS9lFmgzHbEaUlJVPvmZIcJqVwB3QIVqy+a/kQ1ZszIAn1aBmX1VeZb007ENz/ecmMC2usla739HD3wjpWj3NXWy1rF3gwvCejQiBR/PHiFE2CVoTYvWtsCzOTgpf8R4Nvk7LhdKx7fLD1X77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj1n/n9BMHmK5iBDX0+HhWxFc8thjoLICmyD0BsDLR4=;
 b=msxr3WbqQkEOZcLBL3TNfGJJZa44kT4N04FwREokvMN1wITSMrX3DpbCZCenduo5+emWcQnisUIPf0uKXzQgxWzodY17GVvwEOX7ahD5E9YU0RV4M5ASSlNLLqWj4J0oVW/f5fwDXTthottl3UBe+gLItV/LrOCDTyruMFA1HKCGT0fANkR6PCOXiMWm6rBCmTcjDU5070Ovikysaq9KPIooBjJwalNYcs0LTW/w+6P59dSGAwJ5sb+6JDgXrxndAbnKqcpznm/depXecq6R1xTqvuwFUPhboUcxejvmVzZdLG5TLPlMTz9F4LcuCRFn77DqnxfvrwbvV/SOQGwBJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1696.namprd12.prod.outlook.com (10.172.52.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 11:24:44 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::1894:755c:dbb2:7626]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::1894:755c:dbb2:7626%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 11:24:44 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: Fix offset for vmid selection in debugfs
 interface
Thread-Topic: [PATCH] drm/amd/amdgpu: Fix offset for vmid selection in debugfs
 interface
Thread-Index: AQHVO8kRvSSqzqpVH0SqsBcjPPwlnw==
Date: Tue, 16 Jul 2019 11:24:44 +0000
Message-ID: <20190716112434.29017-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR2201CA0034.namprd22.prod.outlook.com
 (2603:10b6:405:5e::47) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1eab972f-a607-4b03-4002-08d709e0336f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1696; 
x-ms-traffictypediagnostic: MWHPR12MB1696:
x-microsoft-antispam-prvs: <MWHPR12MB1696CA367750C26B88DCAC70F7CE0@MWHPR12MB1696.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(199004)(189003)(2501003)(186003)(102836004)(68736007)(26005)(14444005)(256004)(2351001)(81166006)(2616005)(476003)(81156014)(50226002)(4744005)(486006)(6116002)(3846002)(6916009)(8936002)(7736002)(305945005)(36756003)(66066001)(2906002)(86362001)(71190400001)(14454004)(8676002)(478600001)(99286004)(6512007)(66446008)(64756008)(66556008)(66946007)(66476007)(53936002)(25786009)(316002)(386003)(71200400001)(5660300002)(1076003)(4326008)(6486002)(6506007)(52116002)(6436002)(5640700003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1696;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GGvB3FkgtcNIsagbZhpnhlfosLOExN4ILQHNkeOalAqsr3Lt+ToTzyZpMSGvaMyPAiNOISPapZX5WUM28VVEweJtKpz1VUIAAWIFjFzEGMdnJZPM+OQCg9lDxnCbNUSpKV/qQYcaFV5RhXxGqwRm//Yj/KIGk7rWSnOtp2ygEqmwvod91qojhzog6EcPIfEDK5ZihCwmQ98/tzcSNnclPOSUPigy1r/+TCIAWxXZDjZP7U1bUXpM/d1RT7MqJES0+mdboAjDctEE/VQ3UqgYv1ukDR0AiUtv+0z66xoS5wTKZYidUPxjEFbSVe4i2JQkaLxRFOtC5D4RLwIMZIJw80oXdf/IcBteZGxlE2my+XnddyCv1rYztS8fWenBgwD52Rp1JsHgLjYxF9CdIpe9J2maOV7RerTDdUYeQx5GNv0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eab972f-a607-4b03-4002-08d709e0336f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 11:24:44.1211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1696
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj1n/n9BMHmK5iBDX0+HhWxFc8thjoLICmyD0BsDLR4=;
 b=sLuOBdyRLHyLemmx4OqZ3Id5Rt5niMILCAnEDu6HT6+/W8butdOC7DIuDLiIFdv/0aGihsxd3jmFQdbAF0Wz0UBOAATUs8IChkvpntJFCiKMsptas6e0NvHfqEeM/Y/o1FZgChz77LoXfr4IehtcvMBQ13evkRnc11ndvVZSzF4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHJlZ2lzdGVyIGRlYnVnZnMgaW50ZXJmYWNlIHdhcyB1c2luZyB0aGUgd3JvbmcgYml0bWFz
ayBmb3Igdm1pZApzZWxlY3Rpb24gZm9yIEdGWF9DTlRMLgoKU2lnbmVkLW9mZi1ieTogVG9tIFN0
IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
YnVnZnMuYwppbmRleCA4N2IzMjg3MzA0NmYuLjU5ODQ5ZWQ5Nzk3ZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCkBAIC0xMzIsNyArMTMyLDcgQEAgc3Rh
dGljIGludCAgYW1kZ3B1X2RlYnVnZnNfcHJvY2Vzc19yZWdfb3AoYm9vbCByZWFkLCBzdHJ1Y3Qg
ZmlsZSAqZiwKIAkJbWUgPSAoKnBvcyAmIEdFTk1BU0tfVUxMKDMzLCAyNCkpID4+IDI0OwogCQlw
aXBlID0gKCpwb3MgJiBHRU5NQVNLX1VMTCg0MywgMzQpKSA+PiAzNDsKIAkJcXVldWUgPSAoKnBv
cyAmIEdFTk1BU0tfVUxMKDUzLCA0NCkpID4+IDQ0OwotCQl2bWlkID0gKCpwb3MgJiBHRU5NQVNL
X1VMTCg0OCwgNDUpKSA+PiA1NDsKKwkJdm1pZCA9ICgqcG9zICYgR0VOTUFTS19VTEwoNTgsIDU0
KSkgPj4gNTQ7CiAKIAkJdXNlX3JpbmcgPSAxOwogCX0gZWxzZSB7Ci0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
