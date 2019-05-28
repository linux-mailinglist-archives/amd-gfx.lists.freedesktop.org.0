Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51DF2D1A6
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 00:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C3489F89;
	Tue, 28 May 2019 22:44:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680088.outbound.protection.outlook.com [40.107.68.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7247F89F85
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 22:44:41 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3244.namprd12.prod.outlook.com (20.179.105.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 22:44:36 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 22:44:36 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] mm/hmm.c: support automatic NUMA balancing
Thread-Topic: [PATCH 1/2] mm/hmm.c: support automatic NUMA balancing
Thread-Index: AQHVFabsGutdqH7MoUC8FWE/Fms+6Q==
Date: Tue, 28 May 2019 22:44:35 +0000
Message-ID: <20190528224419.14124-2-Felix.Kuehling@amd.com>
References: <20190528224419.14124-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190528224419.14124-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bcae253-9f3e-488d-0b1d-08d6e3be0f12
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3244; 
x-ms-traffictypediagnostic: DM6PR12MB3244:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3244A68000DA9D6414ACBF25921E0@DM6PR12MB3244.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(366004)(199004)(189003)(73956011)(66476007)(305945005)(5640700003)(66556008)(53936002)(186003)(316002)(64756008)(66946007)(81166006)(81156014)(66446008)(6916009)(71190400001)(8676002)(68736007)(7736002)(50226002)(6436002)(966005)(71200400001)(1076003)(36756003)(2906002)(72206003)(14454004)(86362001)(478600001)(66574012)(5660300002)(25786009)(446003)(52116002)(6506007)(76176011)(6486002)(11346002)(386003)(2616005)(14444005)(6512007)(2351001)(99286004)(8936002)(26005)(2501003)(476003)(486006)(66066001)(3846002)(6306002)(102836004)(6116002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3244;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oKHPBxZCh0wWLsw9hIMVx1YYptwb+iWg2KboyVy0lrTG2n/iQdY/3XoYMVURf3/q5BpX3St0rx8hfq0NM35n0X4NEqrl/ev4iEnO4NXKrt4UUJxyKiiaQSZNJ6VGNM8/YgNYWJ3/pf1H5HkufGtHWJ/RUctCkTL8RdALoT91dhBmehd4pSotOtolEaVCJUxHdVLJ8gngZzKFk3pN1xRG7KKiRtmstxl5OvQDw/PkQ7pgVla66+JZpXJACq0Jqd7qYFARYIun9keB+2ogOjdBzEaxocUAzHSEXL66IC6wu3Z+BFs9FbMjkWx3i1XDgncR9hmQH4k92ZUbMk86chTsDQLc0ZcesRNEKwvn8LtGOdlxNm0ZomDlk6kUKg6bUdYWcOGn1EbIo2/1LX0640VYAn5cli2pogi+n1HAQfga5SQ=
Content-ID: <FF092630340E9546BD5C8B8C570E80B8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcae253-9f3e-488d-0b1d-08d6e3be0f12
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 22:44:35.7914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3244
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKMdakIJ49K/YVGALy9gFsUFVqny7pGFfB4r85PbWsw=;
 b=eKnjdr3RrThyXNVPyl9M7/WjouCXG6buIVZWhESaQvDVp+jBoxoaA3AjGJfUqt3YK1BSnVSoBQWxwIq+Lal8zyaA227G/r02uo1H7I45rRfoYDW/4kkzUc2CH7Ev6aGXtpMZUC/POM18dRA9OEOUM1f2OUN6LnjLVKL0oIzTbYw=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQoNCldoaWxlIHRoZSBwYWdl
IGlzIG1pZ3JhdGluZyBieSBOVU1BIGJhbGFuY2luZywgSE1NIGZhaWxlZCB0byBkZXRlY3QgdGhp
cw0KY29uZGl0aW9uIGFuZCBzdGlsbCByZXR1cm4gdGhlIG9sZCBwYWdlLiAgQXBwbGljYXRpb24g
d2lsbCB1c2UgdGhlIG5ldw0KcGFnZSBtaWdyYXRlZCwgYnV0IGRyaXZlciBwYXNzIHRoZSBvbGQg
cGFnZSBwaHlzaWNhbCBhZGRyZXNzIHRvIEdQVSwgdGhpcw0KY3Jhc2ggdGhlIGFwcGxpY2F0aW9u
IGxhdGVyLg0KDQpVc2UgcHRlX3Byb3Rub25lKHB0ZSkgdG8gcmV0dXJuIHRoaXMgY29uZGl0aW9u
IGFuZCB0aGVuIGhtbV92bWFfZG9fZmF1bHQNCndpbGwgYWxsb2NhdGUgbmV3IHBhZ2UuDQoNCkxp
bms6IGh0dHA6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDE5MDUxMDE5NTI1OC45OTMwLTItRmVsaXgu
S3VlaGxpbmdAYW1kLmNvbQ0KU2lnbmVkLW9mZi1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5n
QGFtZC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdA
YW1kLmNvbT4NClJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNv
bT4NCkNjOiBBbGV4IERldWNoZXIgPGFsZXguZGV1Y2hlckBhbWQuY29tPg0KQ2M6IERhdmUgQWly
bGllIDxhaXJsaWVkQGdtYWlsLmNvbT4NClNpZ25lZC1vZmYtYnk6IEFuZHJldyBNb3J0b24gPGFr
cG1AbGludXgtZm91bmRhdGlvbi5vcmc+DQotLS0NCiBtbS9obW0uYyB8IDIgKy0NCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL21t
L2htbS5jIGIvbW0vaG1tLmMNCmluZGV4IDBkYjg0OTEwOTBiOC4uNTk5ZDhlODJkYjY3IDEwMDY0
NA0KLS0tIGEvbW0vaG1tLmMNCisrKyBiL21tL2htbS5jDQpAQCAtNTU5LDcgKzU1OSw3IEBAIHN0
YXRpYyBpbnQgaG1tX3ZtYV9oYW5kbGVfcG1kKHN0cnVjdCBtbV93YWxrICp3YWxrLA0KIA0KIHN0
YXRpYyBpbmxpbmUgdWludDY0X3QgcHRlX3RvX2htbV9wZm5fZmxhZ3Moc3RydWN0IGhtbV9yYW5n
ZSAqcmFuZ2UsIHB0ZV90IHB0ZSkNCiB7DQotCWlmIChwdGVfbm9uZShwdGUpIHx8ICFwdGVfcHJl
c2VudChwdGUpKQ0KKwlpZiAocHRlX25vbmUocHRlKSB8fCAhcHRlX3ByZXNlbnQocHRlKSB8fCBw
dGVfcHJvdG5vbmUocHRlKSkNCiAJCXJldHVybiAwOw0KIAlyZXR1cm4gcHRlX3dyaXRlKHB0ZSkg
PyByYW5nZS0+ZmxhZ3NbSE1NX1BGTl9WQUxJRF0gfA0KIAkJCQlyYW5nZS0+ZmxhZ3NbSE1NX1BG
Tl9XUklURV0gOg0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
