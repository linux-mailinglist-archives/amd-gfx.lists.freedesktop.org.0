Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A44E9B839
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 23:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DC06ED56;
	Fri, 23 Aug 2019 21:33:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700077.outbound.protection.outlook.com [40.107.70.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0406ED46
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 21:33:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nC5HtP5aY+78WK/b3bG2V5ULb0qVsbiSEd6W7LoNvw+DtFvdu7lzeFpZ+u2dwYXfiPG1gEtFBYHHpWwVDQBN3fbQhJ0LjxwAzoJb8b0mDVVRrhmoJk0uydXqnb2vNFIR6vTt7QVFC/gu7Xb5bixftYhokfoLIViKmBHNkJn0aQlEOhBKWh+jL3KkhJbwD82YA/xnQO8rYLyMMYiIbpu1JQ33Q3a2EruGW7/uzzCoN0hLFRmLA56fTL/DC4GHkfHtudlXWzhvLg70fnyN1sDyiMCOUyVB3tnqCG/poN8M7PPuOt5avICgF5RrYBW3XvzJnV2xV8o9p/sQzQr57/EZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ok5Z1aO65tk0Hppz2JSa06WIe4lhNmWrFXEffX/5vE=;
 b=TIQKdpNHzYig+e/NDArHFWx/hK7uY3Xf50IHQlZezxQsGx+pGdaSBHNTBCxM8v/qhjUHfP2U2DNTcYHEFFcMsWUNJTe63iW8eI0ICisVwWfZFPklEWpfYDBOWS/UsxCajWOdTQ+gU9B13MOKo7Tgh20XxfKwzgqJCBZtWQIOq/dRQuakVNL4lHRG4u9RD/7GteFr4kTR1rL4TH77FqY1rFGEFP3pL/Gb0yYfy+HT78+GyXT4nDdADz/IQC2Vii208tCzreUR78grtMEFdv0ANrKRdy+u+qGH13RdVJITKjCgSPe/tnZ9pRXmg+bFjCXUyMhkUOGo0q0sq0TtETYOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3644.namprd12.prod.outlook.com (20.178.199.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 21:33:48 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 21:33:48 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Topic: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Index: AQHVWfpyCsVjPVucSk2VZpnIFr9zeQ==
Date: Fri, 23 Aug 2019 21:33:47 +0000
Message-ID: <20190823213249.10749-4-Felix.Kuehling@amd.com>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190823213249.10749-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YT1PR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::43)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06d5098e-51e3-4b1f-86c6-08d7281194a6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3644; 
x-ms-traffictypediagnostic: DM6PR12MB3644:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB36449DB90E48D60E809475C092A40@DM6PR12MB3644.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(199004)(189003)(14444005)(50226002)(478600001)(86362001)(2616005)(4326008)(26005)(446003)(486006)(186003)(386003)(5640700003)(52116002)(66066001)(25786009)(81156014)(2906002)(14454004)(11346002)(102836004)(76176011)(54906003)(6916009)(66476007)(4744005)(7736002)(2501003)(66946007)(66446008)(5660300002)(36756003)(6506007)(8676002)(8936002)(81166006)(6436002)(53936002)(71190400001)(6512007)(316002)(3846002)(6116002)(6486002)(476003)(66556008)(64756008)(71200400001)(305945005)(1076003)(99286004)(2351001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3644;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hYv0DvR1yRqtetqO3FDt8xsoDRcWxVK4yAsbowRqAHEW6w7w7MOl4WFTSN5ZhRBUL7yHgQXuES1aiCobafnMrfYuYOpJDHlDKxjCCk0d5v+g5Sg6OUDJK7nx3i1600gHj0LmqYWDdt2k6iMHAUf8t2+zJA3rclnn8fosRBg0Jw8T7Xac2bwbtj+lkSeJCsTuvteR1iI6mqAuWgI51hZ9NVVNTKGkDyiFyvlUT9PBiEnw506DFBEklblDdUjiWSehLcHve8okGLJuqVVzpLoDBdeu7Rlc1qkfl0AC5iUdaUPh9A6OdcPkTD8PieF0S3Oz8we96Df0yP/Brq9ZVZeqqDhyYXMkGMizoSX/2jleX8fEMiZ/RW3v8ji5Mk/P57EJbLwxXJljg/q4PY5CrlyCajubwARJTkShA2uaN5gv4ag=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d5098e-51e3-4b1f-86c6-08d7281194a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 21:33:47.2129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZvqBAnyUQOEu6h6HFua98oRcoAW0QVSS6AARtqPo33OpGmgyEMVGsq3mM1kXUW1KVHar4SymhrCJxIiDBFBZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3644
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ok5Z1aO65tk0Hppz2JSa06WIe4lhNmWrFXEffX/5vE=;
 b=kOc938USPz98ph0GTb2z/2m1336ptJKNTAhWIyCg06X7HYbBsfq4HTqfIviBk5NwwQc5onJfd+JkN9piMszaCYUKA+LCWXMI+K2aSYwkK4ZjpwkAwjdVzSSWmkITuEQRtnm1meQI70Ngc6abVDRgSSKIII9s0okR23CisrQnh9k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+CgpTZXQgc25vb3BlZCBQVEUgZmxhZyBh
Y2NvcmRpbmcgdG8gbWFwcGluZyBmbGFnLiBXcml0ZSByZXF1ZXN0IHRvIGEKcGFnZSB3aXRoIHNu
b29wZWQgYml0IHNldCwgd2lsbCBzZW5kIG91dCBpbnZhbGlkYXRlIHByb2JlIHJlcXVlc3QKdG8g
VENDIG9mIHRoZSByZW1vdGUgR1BVIHdoZXJlIHRoZSB2cmFtIHBhZ2UgcmVzaWRlcy4KCkNoYW5n
ZS1JZDogSTc5OWY2OGVjN2E1YTFhYmYzMjA3NWY1ZWYzMTA1MTY0MWEwYjM3MzYKU2lnbmVkLW9m
Zi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggOWFhZmNkYTZjNDg4
Li44YTdjNGVjNjlhZTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpAQCAt
NjA0LDYgKzYwNCw5IEBAIHN0YXRpYyB1aW50NjRfdCBnbWNfdjlfMF9nZXRfdm1fcHRlX2ZsYWdz
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWlmIChmbGFncyAmIEFNREdQVV9WTV9QQUdF
X1BSVCkKIAkJcHRlX2ZsYWcgfD0gQU1ER1BVX1BURV9QUlQ7CiAKKwlpZiAoZmxhZ3MgJiBBTURH
UFVfVk1fUEFHRV9JTlZBTElEQVRFX1BST0JFKQorCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX1NO
T09QRUQ7CisKIAlyZXR1cm4gcHRlX2ZsYWc7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
