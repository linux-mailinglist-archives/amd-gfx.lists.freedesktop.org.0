Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D328552A1
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 16:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C2F6E134;
	Tue, 25 Jun 2019 14:56:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750071.outbound.protection.outlook.com [40.107.75.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AB56E134
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 14:56:08 +0000 (UTC)
Received: from MW2PR12MB2588.namprd12.prod.outlook.com (52.132.181.19) by
 MW2PR12MB2508.namprd12.prod.outlook.com (52.132.180.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 14:56:06 +0000
Received: from MW2PR12MB2588.namprd12.prod.outlook.com
 ([fe80::c1ee:9e63:73d5:e3c8]) by MW2PR12MB2588.namprd12.prod.outlook.com
 ([fe80::c1ee:9e63:73d5:e3c8%6]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 14:56:06 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 08/24] drm/amd/display: add audio related regs
Thread-Topic: [PATCH 08/24] drm/amd/display: add audio related regs
Thread-Index: AQHVHKop4dASIZUaJ0KTM9EdyWdMxaar4AoAgACy2YA=
Date: Tue, 25 Jun 2019 14:56:06 +0000
Message-ID: <81482b83-5fbf-9a45-a373-b04c44bc81a9@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
 <20190606205501.16505-9-Bhawanpreet.Lakha@amd.com>
 <CAPM=9tw86HPHdDN9dAGLtL5RbRyxH69DmWq_0sH5C30xXnx7_w@mail.gmail.com>
In-Reply-To: <CAPM=9tw86HPHdDN9dAGLtL5RbRyxH69DmWq_0sH5C30xXnx7_w@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To MW2PR12MB2588.namprd12.prod.outlook.com
 (2603:10b6:907:a::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6824731f-6b7f-4fe5-e4ac-08d6f97d4000
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MW2PR12MB2508; 
x-ms-traffictypediagnostic: MW2PR12MB2508:
x-microsoft-antispam-prvs: <MW2PR12MB25083B86D00B6B64DC596C8CF9E30@MW2PR12MB2508.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(376002)(366004)(346002)(189003)(199004)(3846002)(486006)(73956011)(6116002)(31686004)(2906002)(8936002)(478600001)(72206003)(5660300002)(8676002)(25786009)(71200400001)(6246003)(71190400001)(81156014)(4326008)(81166006)(6916009)(4744005)(6436002)(66556008)(66476007)(11346002)(446003)(6486002)(66446008)(64756008)(6512007)(305945005)(53936002)(476003)(2616005)(66946007)(7736002)(229853002)(26005)(102836004)(86362001)(66066001)(76176011)(386003)(6506007)(53546011)(14454004)(256004)(36756003)(31696002)(316002)(1411001)(99286004)(186003)(54906003)(68736007)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2508;
 H:MW2PR12MB2588.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QkABAk5BEoAHJEVqXVNhyFC0WtNn7ILxkuqgwPYWDwpNsH2WLMxubP7AtzdRtZwOk97E1SM/jR42Lf5jjwxCM6bQNNFr42uDARmwF/b9SNHbvzTjjWilqfSy0et1kTGx7iH/E0DZ15dOTM2OGYdYbQYKexMQ/pbpjY0sCuU3Brs3+FM3603qPaIF04PHtAnZO4ZWupPPTeB/UZ2yqXtlxl9+3mTDm2BzoDcXJBLrPzo8vr1nf4qAU+5W4c39s5ABF0aedgwtAZ28Z9XtTU23dWT7PJDTim3pZ1IgDeGhzAoPYzh0PmSZHWYe+Py/YzaAbSY4SB5Tyr+MKeNvrr9otsyiLEuMW+nFyOWgj2dSmhj7Yk0UrTxajveMXiRnqUCm5/2WRXNhHr7pPkl7htrxQcN9DmGTSRZ8PGCyuL8lOpA=
Content-ID: <F172D0EAA835DE46888569C2D54C0441@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6824731f-6b7f-4fe5-e4ac-08d6f97d4000
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 14:56:06.6318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: blakha@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2508
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XITUE/fkJ9S3IuH9Uh7k8UOtwE8J8ts12J5fTwy892E=;
 b=DQQy2s98kFyMbAfmXH6kzU3rmI8QH5XGlh5oYMHIjG3OddfN7nOYaOpWPCzl6F/fPgaMN0tDQhJRe5OD+7PBzmeUa4RrxB9cGHKHBxddb8Lu9F4rijDUyWekh9jv68KBMlfkyGoIrR/8X/FqkwELj5y3WFg74L+sgBCprRRFce4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bhawanpreet.Lakha@amd.com; 
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
Cc: "Liu, Charlene" <Charlene.Liu@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciBjYXRjaGluZyB0aGF0LCBpdCB3YXMgbGVmdCBpbiBieSBtaXN0YWtlIHdoZW4g
dHJ5aW5nIHRvIGZpeCANCnNvbWUgY29tcGlsZSBpc3N1ZXMuIEkgd2lsbCBwdXNoIGEgcGF0Y2gg
dG8gcmVtb3ZlIGl0DQoNCg0KQmhhd2FuDQoNCk9uIDIwMTktMDYtMjUgMTI6MTUgYS5tLiwgRGF2
ZSBBaXJsaWUgd3JvdGU6DQo+IE9uIEZyaSwgNyBKdW4gMjAxOSBhdCAwNjo1NSwgQmhhd2FucHJl
ZXQgTGFraGENCj4gPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+IHdyb3RlOg0KPj4gRnJvbTog
Q2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBDaGFybGVuZSBMaXUgPGNoYXJsZW5lLmxpdUBhbWQuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IENo
cmlzIFBhcmsgPENocmlzLlBhcmtAYW1kLmNvbT4NCj4+IEFja2VkLWJ5OiBCaGF3YW5wcmVldCBM
YWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRpby5jIHwgNCArLS0tDQo+PiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1ZGlvLmggfCA3ICsrKysrKysNCj4+
ICAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1
ZGlvLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRpby5jDQo+
PiBpbmRleCA3ZjZkNzI0Njg2ZjEuLmQ0M2Q1ZDkyNGMxOSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1ZGlvLmMNCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1ZGlvLmMNCj4+IEBAIC0yMiw3ICsy
Miw3IEBADQo+PiAgICAqIEF1dGhvcnM6IEFNRA0KPj4gICAgKg0KPj4gICAgKi8NCj4+IC0NCj4+
ICsjaW5jbHVkZSAiLi4vZGMuaCINCj4gSXMgdGhpcyBpbmNsdWRlIG5lZWRlZD8ganVzdCBzZWVt
cyB3aWVyZCB0byBoYXZlIGFkZGVkIGl0IHdpdGggbm8gbWVudGlvbi4NCj4NCj4gRGF2ZS4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
