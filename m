Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82635BEE30
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 11:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F257A6ECC2;
	Thu, 26 Sep 2019 09:14:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790042.outbound.protection.outlook.com [40.107.79.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E725E6ECC2
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 09:14:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5n0SUokaf4p94vJp4dmCgnke1gbERU51VQwH2pPsjZwKY1xrUrVnXoxlrhUQTAEJnkruHlzqwVUnFUnZc19Aal0IWl9XiLSB+6cKHuuq5duL0OUbdw0snptwb9fDv3Fr7RikrfZdxQqsTp0qkY14NvNixV9w8iN5t/i5c6QIzCsbJgfy/igsCP3tkSqmb/CgPGu4wk+beDJQ+LalkroZKwESZPddtMNLRzanMCayskxJE6gy2iCLURvTZ0jEUC3RPxp9uCI5iZswGzuqd0xGlH7t9FDICFVGFylRfXuY9SZ5GmL/mr2mgWI/DiWyqBUtnQD4T1iBHsDGfhlLLtDyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pum5rkYkFKlWggUrraxBRYXzdP1fUdiG0qKDgvnA210=;
 b=irkLt6mCIhHlyO6qC/eW6GqiU2q77P2wo5LiHk6dfAGFAIJnGr33CdFXmHamgYVOsq5gXit+Rnet+mKJrdbAZJadV0zC4GYQTj7A9dhiy0sYDpUg/FBFHXktEWczWK4vQxRXUPR75K0ELn7oHQxPj/TywKEszuSVHEcmTxAOWb3xveA8f/HjDgOep23aYTsFd2V6yFdx2EZs2vrdTANtmNNohrEUKdCzH8HFGEX/cQ0Jm0VT9KyhkIbkY1kwxqbHvjN3tt0y1X8eKXeyVFnHkjeiv+41cUc0rNYQuj0p6F4LHaifVQsBKVI6OcCuZu6ZlgyTrsKz7nEV8TWo8sDd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3438.namprd12.prod.outlook.com (20.178.242.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Thu, 26 Sep 2019 09:14:14 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 09:14:14 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/powerplay: change metrics update period from 1ms
 to 100ms
Thread-Topic: [PATCH v2] drm/amd/powerplay: change metrics update period from
 1ms to 100ms
Thread-Index: AQHVdErDTYC4cxsAwEi6651LgmXZ/g==
Date: Thu, 26 Sep 2019 09:14:14 +0000
Message-ID: <20190926091359.5467-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0078.apcprd04.prod.outlook.com
 (2603:1096:202:15::22) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8ad9096-5e67-4a11-83b8-08d74261e618
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3438; 
x-ms-traffictypediagnostic: MN2PR12MB3438:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3438994C3A13DE31382F1F7DA2860@MN2PR12MB3438.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(189003)(199004)(386003)(36756003)(6506007)(66446008)(102836004)(186003)(54906003)(66476007)(66556008)(316002)(66946007)(64756008)(2501003)(26005)(15650500001)(8676002)(52116002)(2906002)(8936002)(99286004)(81166006)(81156014)(256004)(486006)(50226002)(14444005)(476003)(6916009)(2351001)(2616005)(6512007)(478600001)(305945005)(7736002)(86362001)(5660300002)(1076003)(3846002)(6116002)(5640700003)(71200400001)(71190400001)(4326008)(14454004)(25786009)(66066001)(6436002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3438;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hWsqAM13SjMfVS6X2pJCUkIxaaFF1MmXYkWBkjoAMxHqPTq80y8MTFVU8PuRvfO8IDIrFoMLgSppGUh/vbcRvBXo0eQJAmlMTNxyIbzyg1J+WeaMvoPbeQiofIyV8JDLqIJOJ6r1I6MlxaPK4w0ZeWlXVj7wtP5Gf86R1igeesqUHFqq3RCwdUaxB3lnjoYaaeXi5FzoK58ty1ZUCGrm/n5weagkpmBrgk/iW+bQrRMxR6/G1flbnrUE2O0Yehib6v6CY3XGsooQPLfnOU9CExKVYrGxUCKGp53sDCysS6i5mtE7xbGbscYHBdZtc00HxlqDAcdHerkjE12/t/jOv/huUlJXdw3kNG5xhZH7VNikwPWTUf9aAzEG5nbwO/GXZ3/vXU8WamdeQ7KqY8mvqMF9dLpDRd2NhtS0GiK/8nM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ad9096-5e67-4a11-83b8-08d74261e618
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 09:14:14.0708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XovpOvTVNifrdvRfbSNzMLuIgzBgaqjEd6+S/6b2Li9jKh5fjMlH2hOmNm/aN26O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3438
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pum5rkYkFKlWggUrraxBRYXzdP1fUdiG0qKDgvnA210=;
 b=MixjRJJP0kYOHjcBvM2PEgBJLzYHzkMfjRhU6HUEz0d14LycqFixGcnl5pBIlM5tR+L3PigGwZ/VOT95QU970D6TA21kNUQB0ZF9Zefd8hLRG8hd5sCwCOCewVkCp1/X8yW7rFeQ56nnstqmheEeE4hbnso3QRhMSoYKas9jrZM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

djI6CmNoYW5nZSBwZXJpb2QgZnJvbSAxMG1zIHRvIDEwMG1zICh0eXBvIGVycm9yKQoKdG9vIGhp
Z2ggZnJlcXVlbmNlIHRvIHVwZGF0ZSBtZXJ0cmljcyB0YWJsZSB3aWxsIGNhdXNlIHNtdSBmaXJt
d2FyZQplcnJvcixzbyBjaGFuZ2UgbWVydHJpY3MgdGFibGUgdXBkYXRlIHBlcmlvZCBmcm9tIDFt
cyB0byAxMDBtcwoobmF2aTEwLCAxMiwgMTQpCgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5nIDxr
ZXZpbjEud2FuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25h
dmkxMF9wcHQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRl
eCA0YzI4YWFkZWY1MDQuLjBhNDRhYTgxZDQzNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtNTQ4LDcgKzU0OCw3IEBAIHN0YXRpYyBpbnQgbmF2aTEw
X2dldF9tZXRyaWNzX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCXN0cnVjdCBzbXVf
dGFibGVfY29udGV4dCAqc211X3RhYmxlPSAmc211LT5zbXVfdGFibGU7CiAJaW50IHJldCA9IDA7
CiAKLQlpZiAoIXNtdV90YWJsZS0+bWV0cmljc190aW1lIHx8IHRpbWVfYWZ0ZXIoamlmZmllcywg
c211X3RhYmxlLT5tZXRyaWNzX3RpbWUgKyBIWiAvIDEwMDApKSB7CisJaWYgKCFzbXVfdGFibGUt
Pm1ldHJpY3NfdGltZSB8fCB0aW1lX2FmdGVyKGppZmZpZXMsIHNtdV90YWJsZS0+bWV0cmljc190
aW1lICsgbXNlY3NfdG9famlmZmllcygxMDApKSkgewogCQlyZXQgPSBzbXVfdXBkYXRlX3RhYmxl
KHNtdSwgU01VX1RBQkxFX1NNVV9NRVRSSUNTLCAwLAogCQkJCSh2b2lkICopc211X3RhYmxlLT5t
ZXRyaWNzX3RhYmxlLCBmYWxzZSk7CiAJCWlmIChyZXQpIHsKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
