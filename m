Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F91B58E
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930EC890FE;
	Sun, 28 Apr 2019 07:44:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810082.outbound.protection.outlook.com [40.107.81.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C4F890FE
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:06 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:05 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:05 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/27] drm/amdkfd: Differentiate b/t sdma_id and sdma_queue_id
Thread-Topic: [PATCH 03/27] drm/amdkfd: Differentiate b/t sdma_id and
 sdma_queue_id
Thread-Index: AQHU/ZYn5aFBqzNgj0GRQhen41bgDQ==
Date: Sun, 28 Apr 2019 07:44:05 +0000
Message-ID: <20190428074331.30107-4-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e560089f-722c-463b-3682-08d6cbad4a02
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB2933A3C6ED8C8561AC31342F92380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bxA4G621mVq9lIamA3vohzIVKZmyH1M/v6V2zuRZlOenMhK3ejresas4MnMBv8FI76RLQdXyW8NPi7X29ZtaZJ7IHl4QTPy65vzrs2ZwA8bT/3felL9kjotjtFTclgqmmawvUD8eN1sdtoQMjOcro2DixIWkTbKrSVRqoKgAOfc9XvZGHhRZX00GKBU4RYzjX2KWYqXD+MD5QX2+vmftwBu27u+1qqarCkOvbmzNdg4ax5K+YApQxRbJixi7ClTCgeUhRjU3k5zU7SM1M/3zNQ1Bq8Mc0pD5Da7rfE/O7Np+AgcKII9LDsm7GS4gnHvOn4RxLDKV2ZNOyONoX2AHzvVjww7wu3D5yvrocVUqQqoEKIDIXwYo/c4EN8SK1+XICtMfGGL218/kw1YGwaG4PeE8nwaAwi9c87Y0yWQm5ws=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e560089f-722c-463b-3682-08d6cbad4a02
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:05.3055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJt72zMpx133qzc39rEqYl+hU9iNZ1BqmT79qd9gQ74=;
 b=LlOFu/5wb+500QTGD6VIG/iEckn7b9RnIqOh4d7aBUlacOQNHMIryvDrYYyYKD9BcYG2dZGYszG6fyzgO7MKxGHY+Era0IfLlONgjs6rRGA9VZIilWNDEIiXDaan5r8GiroE0F0xc5EFGz3h74+gsTLzAbLjSYcrc41VDFO+6cw=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPG96ZW5nQGFtZC5jb20+DQoNCnNkbWFfcXVldWVfaWQgaXMgc2RtYSBx
dWV1ZSBpbmRleCBpbnNpZGUgb25lIHNkbWEgZW5naW5lLg0Kc2RtYV9pZCBpcyBzZG1hIHF1ZXVl
IGluZGV4IGFtb25nIGFsbCBzZG1hIGVuZ2luZXMuIFVzZQ0KdGhvc2UgdHdvIG5hbWVzIHByb3Bl
cmx5Lg0KDQpTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8b3plbmdAYW1kLmNvbT4NClJldmlld2Vk
LWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NClNpZ25lZC1vZmYt
Ynk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAxMCArKysr
Ky0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVl
dWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1
ZV9tYW5hZ2VyLmMNCmluZGV4IDkzN2VkMWE3MDUwZC4uN2U1ZWFkMDQyZGMwIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdl
ci5jDQpAQCAtOTIyLDcgKzkyMiw3IEBAIHN0YXRpYyBpbnQgc3RvcF9ub2Nwc2NoKHN0cnVjdCBk
ZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtKQ0KIH0NCiANCiBzdGF0aWMgaW50IGFsbG9jYXRlX3Nk
bWFfcXVldWUoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQotCQkJCXVuc2lnbmVk
IGludCAqc2RtYV9xdWV1ZV9pZCkNCisJCQkJdW5zaWduZWQgaW50ICpzZG1hX2lkKQ0KIHsNCiAJ
aW50IGJpdDsNCiANCkBAIC05MzEsMTcgKzkzMSwxNyBAQCBzdGF0aWMgaW50IGFsbG9jYXRlX3Nk
bWFfcXVldWUoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQogDQogCWJpdCA9IF9f
ZmZzNjQoZHFtLT5zZG1hX2JpdG1hcCk7DQogCWRxbS0+c2RtYV9iaXRtYXAgJj0gfigxVUxMIDw8
IGJpdCk7DQotCSpzZG1hX3F1ZXVlX2lkID0gYml0Ow0KKwkqc2RtYV9pZCA9IGJpdDsNCiANCiAJ
cmV0dXJuIDA7DQogfQ0KIA0KIHN0YXRpYyB2b2lkIGRlYWxsb2NhdGVfc2RtYV9xdWV1ZShzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCi0JCQkJdW5zaWduZWQgaW50IHNkbWFfcXVl
dWVfaWQpDQorCQkJCXVuc2lnbmVkIGludCBzZG1hX2lkKQ0KIHsNCi0JaWYgKHNkbWFfcXVldWVf
aWQgPj0gZ2V0X251bV9zZG1hX3F1ZXVlcyhkcW0pKQ0KKwlpZiAoc2RtYV9pZCA+PSBnZXRfbnVt
X3NkbWFfcXVldWVzKGRxbSkpDQogCQlyZXR1cm47DQotCWRxbS0+c2RtYV9iaXRtYXAgfD0gKDFV
TEwgPDwgc2RtYV9xdWV1ZV9pZCk7DQorCWRxbS0+c2RtYV9iaXRtYXAgfD0gKDFVTEwgPDwgc2Rt
YV9pZCk7DQogfQ0KIA0KIHN0YXRpYyBpbnQgY3JlYXRlX3NkbWFfcXVldWVfbm9jcHNjaChzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCi0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
