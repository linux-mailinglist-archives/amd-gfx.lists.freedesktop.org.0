Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F15313D2
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 19:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E43B89798;
	Fri, 31 May 2019 17:28:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700052.outbound.protection.outlook.com [40.107.70.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7368789798
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 17:28:31 +0000 (UTC)
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (10.174.106.148) by
 DM5PR1201MB0186.namprd12.prod.outlook.com (10.174.246.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Fri, 31 May 2019 17:28:29 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae%9]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 17:28:29 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: use new HMM APIs and helpers
Thread-Topic: [PATCH] drm/amdgpu: use new HMM APIs and helpers
Thread-Index: AQHVFvW7FwLiVzA03k2ytJmujZXksaaEQkeAgAE8UIA=
Date: Fri, 31 May 2019 17:28:29 +0000
Message-ID: <bd8f1fd6-f6c4-66fc-c0b9-c8ed36cd6027@amd.com>
References: <20190530144049.1996-1-Philip.Yang@amd.com>
 <704410a5-be01-f423-11ef-01a640cd469c@amd.com>
In-Reply-To: <704410a5-be01-f423-11ef-01a640cd469c@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::15) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14cd0aeb-4655-4b98-1863-08d6e5ed6536
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB0186; 
x-ms-traffictypediagnostic: DM5PR1201MB0186:
x-microsoft-antispam-prvs: <DM5PR1201MB0186EA79E87F306A387EEA6BE6190@DM5PR1201MB0186.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(376002)(136003)(396003)(39860400002)(199004)(189003)(4744005)(66946007)(2906002)(73956011)(386003)(76176011)(6506007)(64756008)(66446008)(66476007)(256004)(81166006)(478600001)(53546011)(6486002)(102836004)(52116002)(2501003)(53936002)(316002)(99286004)(6246003)(14444005)(229853002)(68736007)(81156014)(6512007)(66066001)(186003)(66556008)(31696002)(25786009)(26005)(71190400001)(476003)(6436002)(110136005)(31686004)(14454004)(8676002)(5660300002)(36756003)(486006)(71200400001)(7736002)(86362001)(305945005)(72206003)(2616005)(3846002)(446003)(6116002)(11346002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0186;
 H:DM5PR1201MB0155.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: p3oYzzzifwbNanihydCjbzGtVii/fn2IHP50eEczpQryBecUl0auQvsIQdUkbVsPqm2tKWXVo19f+Eb9z1yJlK7wU4AljWGTQ8suBoQSTTE1ZIYERMTqLKec+/Fgb+Fs0rMdp79aCl3e2LSdTovO1zViDUff8gplFpbfi3ZiFJJ/I9AKCPp1TwCxanCSrGEbUUMDs4M5u3SQWA1sabr94Wd9BUpmC7c0Bzt7SkChe6NizZUbTm7UmyRb0tVoZDV5scV2qY+Vmk2uQOsToID3XRugA51clooQju5BS3lwu4kSQofuDmsuNIk4nbvgkfxfq1XQbYAemtuwYyyYGqq2vo7z6ieYZVAWPxdV9b8wdnar3aGJitIYD/sUixUglCHiiiJNn92i7Z4iPS9H8T/Cya74Sa/kQ9wfWR5w4Al47c4=
Content-ID: <D2577B7245214B4BA5967E578AF1CB58@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cd0aeb-4655-4b98-1863-08d6e5ed6536
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 17:28:29.0820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yangp@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0186
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTjRsYKSFPjhJ4WEz4kDDJhh24ivsLQlbLRcrBxTS/Y=;
 b=shbdt5Y6MmlAdsJAFUh5zaL9YVg85LPIli3Sh+vPCxUHwdz4BDEtRBIdsWILW+eWse6JQHHrbw2Zn5rlxSucrE1C1EV9ayaaq5+XqbrlBMKDNABgCNmr/i8hLfHkEkh2DydH8pqv543npO0hvLs0EnnaU9rDMcial8cj/qAAzfs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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

DQoNCk9uIDIwMTktMDUtMzAgNjozNiBwLm0uLCBLdWVobGluZywgRmVsaXggd3JvdGU6DQo+PiAg
ICANCj4+ICAgICNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fQU1ER1BVX1VTRVJQVFIpDQo+PiAt
CWlmIChndHQtPnJhbmdlcyAmJg0KPj4gLQkgICAgdHRtLT5wYWdlc1swXSA9PSBobW1fcGZuX3Rv
X3BhZ2UoJmd0dC0+cmFuZ2VzWzBdLA0KPj4gLQkJCQkJICAgICBndHQtPnJhbmdlc1swXS5wZm5z
WzBdKSkNCj4+ICsJaWYgKGd0dC0+cmFuZ2UgJiYNCj4+ICsJICAgIHR0bS0+cGFnZXNbMF0gPT0g
aG1tX2RldmljZV9lbnRyeV90b19wYWdlKGd0dC0+cmFuZ2UsDQo+PiArCQkJCQkJICAgICAgZ3R0
LT5yYW5nZS0+cGZuc1swXSkpDQo+IEkgdGhpbmsganVzdCBjaGVja2luZyBndHQtPnJhbmdlIGhl
cmUgaXMgZW5vdWdoLiBJZiBndHQtPnJhbmdlIGlzIG5vdA0KPiBOVUxMIGhlcmUsIHdlJ3JlIGxl
YWtpbmcgbWVtb3J5Lg0KPiANCklmIGp1c3QgY2hlY2tpbmcgZ3R0LT5yYW5nZSwgdGhlcmUgaXMg
YSBmYWxzZSB3YXJuaW5nIGluIGFtZGdwdV90ZXN0IA0KdXNlcnB0ciBjYXNlIGluIGFtZGdwdV9j
c19saXN0X3ZhbGlkYXRlIHBhdGguIElmIHVzZXJwdHIgaXMgaW52YWxpZGF0ZWQsIA0KdGhlbiB0
dG0tPnBhZ2VzWzBdIGlzIG91dGRhdGVkIHBhZ2VzLCBsb2JqLT51c2VyX3BhZ2VzIGlzIG5ldyBw
YWdlcywgaXQgDQpnb2VzIHRvIHR0bV90dF91bmJpbmQgZmlyc3QgdG8gdW5waW4gb2xkIHBhZ2Vz
ICh0aGlzIGNhdXNlcyBmYWxzZSANCndhcm5pbmcpIHRoZW4gY2FsbCBhbWRncHVfdHRtX3R0X3Nl
dF91c2VyX3BhZ2VzLg0KDQpJIHdpbGwgc3VibWl0IHBhdGNoIHYyLCB0byBhZGQgcmV0cnkgaWYg
aG1tX3JhbmdlX2ZhdWx0IHJldHVybnMgLUVBR0FJTi4gDQp1c2Uga3phbGxvYyB0byBhbGxvY2F0
ZSBzbWFsbCBzaXplIHJhbmdlLg0KDQpUaGFua3MsDQpQaGlsaXANCg0KPiBSZWdhcmRzLA0KPiAg
IMKgIEZlbGl4DQo+IA0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
