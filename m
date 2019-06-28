Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D98359760
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 11:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E426E89B;
	Fri, 28 Jun 2019 09:23:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680051.outbound.protection.outlook.com [40.107.68.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD726E89B
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 09:23:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=jgi8/ok6NKwKUYGQhuUyPy8fUQt7pcm6aPIDMhQ8IT9FJauVoEXGYalIJMy+pWdfgAplrWT8SzcGlntnR3q6Z5JB47NieiWCrMenEa4+bmoYfkrrYDsjCAKwScOCevVGlTH+3Vjd3tdQ5Zxjh3fxDQZjjriLUVzaUn1bVvpF4Jc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyneasWY2OFKj5Fc9fmguxr2cdnMt0qpkx3AHPVo2nU=;
 b=FGSaj6aX871mSRNoI5qAHzIbifIF0tNi9nL/K3+ud9BiTzyCa614Qx22FgXGmnA/JkAjvdHCHuua0eImUT6QWFOYF6YceyVQcxNDiGLmVOoFB987KBHarTC58DzG2OfxONK2V71KwfS0NnsbH96E6nmXzeep4QMuWP45FSKAXpw=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3456.namprd12.prod.outlook.com (20.178.242.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 09:23:30 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5%6]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 09:23:30 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3] drm/amdgpu: fix scheduler timeout calc
Thread-Topic: [PATCH v3] drm/amdgpu: fix scheduler timeout calc
Thread-Index: AQHVLZMmePGedaTa3Eu6mcDqBQ3ilA==
Date: Fri, 28 Jun 2019 09:23:29 +0000
Message-ID: <1561713800-25552-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::36) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16445ae7-6652-42c0-8b50-08d6fbaa4851
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3456; 
x-ms-traffictypediagnostic: MN2PR12MB3456:
x-microsoft-antispam-prvs: <MN2PR12MB3456FBDCE7398E43EF558C04FAFC0@MN2PR12MB3456.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(199004)(189003)(81166006)(256004)(316002)(14454004)(3846002)(186003)(4326008)(52116002)(53936002)(36756003)(6116002)(66446008)(73956011)(86362001)(2351001)(25786009)(2906002)(64756008)(66946007)(6506007)(6486002)(386003)(66556008)(6512007)(66476007)(6436002)(6916009)(66066001)(5640700003)(50226002)(305945005)(7736002)(71190400001)(71200400001)(26005)(476003)(486006)(8936002)(72206003)(2616005)(102836004)(2501003)(8676002)(478600001)(5660300002)(68736007)(99286004)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3456;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UWwtuWLd/iXxTxEa4mkJzV/5HaNFLvxJo5StTtkU0ClHKpzlEzGemwcq5cJzwJNJHeTRmgX+42EbJemmQhuXBEBPTsibAjjuxTFo6wZvLcjy89C8g5FLQ+r2aDIfiyeDsRfgIErJC5c9C8Lj83HHPwg+uhrB1jaTVEibH8PyoIEA69lUpByr0Zy5FaMT5VKVcBhE8fckmMMOmc866qnSS2r1MqmuRARNeEQBF0SVLJ6JVsZTdRFCoRjXKMUHWeUKEmhm0PHbOgMmn10EgvTVlPF74N+xcQ3wT0JywkQa1L7mpso268CQc7+9mCP0oqZsQx3+ZhldK4g45qreuyE1MRMozOiKEeGZcepV0q6tjorJDWLpMXpuy6entinMDhQPL99Xiu4hzuVzkX+YVmbHmAgJy8Z7+1/0RfzCYndlbJg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16445ae7-6652-42c0-8b50-08d6fbaa4851
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 09:23:29.9717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3456
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyneasWY2OFKj5Fc9fmguxr2cdnMt0qpkx3AHPVo2nU=;
 b=faXCUHvJ6dMg2mpQZgQO0eeE7YUxxz31VL0tr/gks3PSAU8GQYDy4cnmOvymBc6qRJ8WldJKtFEAmixZ7EDG9bLsAxOrrNRdZTq8nM4JiCKz+GgDSDh0eUcteO2+nD42ZQD49AZ+sMY4fcKAtCgWy7zmbaCl55+oenKkxFlK26k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c2NoZWR1bGVyIHRpbWVvdXQgaXMgaW4gamlmZmllcw0KdjI6IG1vdmUgdGltZW91dCBjaGVjayB0
byBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyBhZnRlcg0KcGFyc2luZyB0
aGUgdmFsdWUNCnYzOiBhZGQgbG9ja3VwX3RpbWVvdXQgcGFyYW0gY2hlY2suIDA6IGtlZXAgZGVm
YXVsdCB2YWx1ZS4gbmVnYXRpdmU6DQppbmZpbml0eSB0aW1lb3V0Lg0KDQpDaGFuZ2UtSWQ6IEky
NjcwOGMxNjNkYjk0M2ZmOGQ5MzBkZDgxYmNhYjRiNGI5ZDg0ZWIyDQpTaWduZWQtb2ZmLWJ5OiBG
bG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jIHwgMTQgKysrKysrKysrKy0tLS0NCiAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kcnYuYw0KaW5kZXggZTc0YTE3NS4uMGQ2NjdmYSAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQpAQCAtMjQ1LDcgKzI0NSw4IEBAIG1vZHVsZV9w
YXJhbV9uYW1lZChtc2ksIGFtZGdwdV9tc2ksIGludCwgMDQ0NCk7DQogICogQnkgZGVmYXVsdCh3
aXRoIG5vIGxvY2t1cF90aW1lb3V0IHNldHRpbmdzKSwgdGhlIHRpbWVvdXQgZm9yIGFsbCBub24t
Y29tcHV0ZShHRlgsIFNETUEgYW5kIFZpZGVvKQ0KICAqIGpvYnMgaXMgMTAwMDAuIEFuZCB0aGVy
ZSBpcyBubyB0aW1lb3V0IGVuZm9yY2VkIG9uIGNvbXB1dGUgam9icy4NCiAgKi8NCi1NT0RVTEVf
UEFSTV9ERVNDKGxvY2t1cF90aW1lb3V0LCAiR1BVIGxvY2t1cCB0aW1lb3V0IGluIG1zIChkZWZh
dWx0OiAxMDAwMCBmb3Igbm9uLWNvbXB1dGUgam9icyBhbmQgbm8gdGltZW91dCBmb3IgY29tcHV0
ZSBqb2JzKSwgIg0KK01PRFVMRV9QQVJNX0RFU0MobG9ja3VwX3RpbWVvdXQsICJHUFUgbG9ja3Vw
IHRpbWVvdXQgaW4gbXMgKGRlZmF1bHQ6IDEwMDAwIGZvciBub24tY29tcHV0ZSBqb2JzIGFuZCBp
bmZpbml0eSB0aW1lb3V0IGZvciBjb21wdXRlIGpvYnMuIg0KKwkJIiAwOiBrZWVwIGRlZmF1bHQg
dmFsdWUuIG5lZ2F0aXZlOiBpbmZpbml0eSB0aW1lb3V0KSwgIg0KIAkJImZvcm1hdCBpcyBbTm9u
LUNvbXB1dGVdIG9yIFtHRlgsQ29tcHV0ZSxTRE1BLFZpZGVvXSIpOw0KIG1vZHVsZV9wYXJhbV9z
dHJpbmcobG9ja3VwX3RpbWVvdXQsIGFtZGdwdV9sb2NrdXBfdGltZW91dCwgc2l6ZW9mKGFtZGdw
dV9sb2NrdXBfdGltZW91dCksIDA0NDQpOw0KIA0KQEAgLTEzMDAsNyArMTMwMSw5IEBAIGludCBh
bWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikNCiAJICogQnkgZGVmYXVsdCB0aW1lb3V0IGZvciBub24gY29tcHV0ZSBqb2JzIGlz
IDEwMDAwLg0KIAkgKiBBbmQgdGhlcmUgaXMgbm8gdGltZW91dCBlbmZvcmNlZCBvbiBjb21wdXRl
IGpvYnMuDQogCSAqLw0KLQlhZGV2LT5nZnhfdGltZW91dCA9IGFkZXYtPnNkbWFfdGltZW91dCA9
IGFkZXYtPnZpZGVvX3RpbWVvdXQgPSAxMDAwMDsNCisJYWRldi0+Z2Z4X3RpbWVvdXQgPQ0KKwlh
ZGV2LT5zZG1hX3RpbWVvdXQgPQ0KKwlhZGV2LT52aWRlb190aW1lb3V0ID0gbXNlY3NfdG9famlm
ZmllcygxMDAwMCk7DQogCWFkZXYtPmNvbXB1dGVfdGltZW91dCA9IE1BWF9TQ0hFRFVMRV9USU1F
T1VUOw0KIA0KIAlpZiAoc3RybmxlbihpbnB1dCwgQU1ER1BVX01BWF9USU1FT1VUX1BBUkFNX0xF
TlRIKSkgew0KQEAgLTEzMTAsMTAgKzEzMTMsMTMgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ2V0X2pv
Yl90aW1lb3V0X3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIAkJCWlmIChy
ZXQpDQogCQkJCXJldHVybiByZXQ7DQogDQotCQkJLyogSW52YWxpZGF0ZSAwIGFuZCBuZWdhdGl2
ZSB2YWx1ZXMgKi8NCi0JCQlpZiAodGltZW91dCA8PSAwKSB7DQorCQkJaWYgKHRpbWVvdXQgPT0g
MCkgew0KIAkJCQlpbmRleCsrOw0KIAkJCQljb250aW51ZTsNCisJCQl9IGVsc2UgaWYgKHRpbWVv
dXQgPCAwKSB7DQorCQkJCXRpbWVvdXQgPSBNQVhfU0NIRURVTEVfVElNRU9VVDsNCisJCQl9IGVs
c2Ugew0KKwkJCQl0aW1lb3V0ID0gbXNlY3NfdG9famlmZmllcyh0aW1lb3V0KTsNCiAJCQl9DQog
DQogCQkJc3dpdGNoIChpbmRleCsrKSB7DQotLSANCjIuNy40DQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
