Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F3F63B9F
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 21:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EEA6E098;
	Tue,  9 Jul 2019 19:03:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9014E6E0A1
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 19:03:03 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3498.namprd12.prod.outlook.com (20.178.199.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 19:03:01 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 19:03:01 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: Add flag for allocating memory for
 sensitive data
Thread-Topic: [PATCH 1/3] drm/amdgpu: Add flag for allocating memory for
 sensitive data
Thread-Index: AQHVNhfAtkAJMzNa0UazWeKukI/fz6bCQCOAgABlhwA=
Date: Tue, 9 Jul 2019 19:03:01 +0000
Message-ID: <23cc0fc1-ec60-8120-a59b-3fd08eb100ac@amd.com>
References: <20190709053222.22588-1-Felix.Kuehling@amd.com>
 <CADnq5_M8dWR8HiCQoEikLDm7EKjPt3Qp8c3NK1ZA68QXOnp_2w@mail.gmail.com>
In-Reply-To: <CADnq5_M8dWR8HiCQoEikLDm7EKjPt3Qp8c3NK1ZA68QXOnp_2w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTBPR01CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::45) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08e9947b-bf5a-4833-2fa9-08d704a01082
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3498; 
x-ms-traffictypediagnostic: DM6PR12MB3498:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3498E90C356A9F2931B3952392F10@DM6PR12MB3498.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(189003)(199004)(186003)(58126008)(31686004)(446003)(81156014)(81166006)(316002)(476003)(76176011)(65956001)(65806001)(386003)(6506007)(11346002)(99286004)(2616005)(6116002)(68736007)(53936002)(8936002)(72206003)(86362001)(102836004)(7736002)(53546011)(6916009)(26005)(305945005)(6486002)(486006)(6246003)(8676002)(3846002)(31696002)(14454004)(1411001)(6436002)(66066001)(73956011)(256004)(36756003)(4326008)(5660300002)(25786009)(478600001)(6306002)(6512007)(66946007)(71200400001)(66476007)(66556008)(64756008)(66446008)(71190400001)(2906002)(966005)(65826007)(229853002)(64126003)(52116002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3498;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DXNxuB+zcmj7BSqooaXZ49j1dMGDjPiGeQqTj68AJW/KPb2UQpwEukzAlBseU0LjDfl7vNbXxjdWqHKqB+hEhRwWrHqo76HAO8nOWxYfF6/G+4IHIjgziugMDBbIppAw4K1qC7/5OuzzEXBYcaB7y/Nh6tsCDOxLvgsJM0ec18m7oZ27RvuFyh2lnCp1kqr7IqKitDtIkzHjeHjoaXr8W8BzbUbLtFJFsARv1xgAd6Hb5/0JQROSY+iMKqtJQ9LwTX9Nu34ZaTAEE6Th5oMXWsJwpd2lmxgGsJzN9anzTWOhzys4R8jaYtWESF9XhX9o0luvvImYTjyKzqTyly1r7eizAQw5TA2mQM4G3F/SXllQob+QrmWs0vqWI7AP8iwuAgZ7PvnhUjPbd8VvAVA9gqWpbHgde0AdtbzWbtCHLOk=
Content-ID: <5A1DAF7183D28C4193522F48BB152A83@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e9947b-bf5a-4833-2fa9-08d704a01082
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 19:03:01.7328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3498
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqdZ4Nmat80gmJQcrfBZerzKCsBEV4eEzKAFV3sCQYo=;
 b=hBR7lF9QBvxw/YqF5nNUjD1h5wNeIDixlTuoclhmMxNP9nhE2IFfuO3NifvJPxdR1Ji51f243mLL4BnxYu4O5E6li0EVpIPH9HepHeQVjRX2YAR+RpR11xklgr1UdsrGmGKtDzWuLZvWV+bhQutcT4xuCvuejpZzcL4El0ayhrU=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wOSA4OjU5IGEubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gT24gVHVlLCBK
dWwgOSwgMjAxOSBhdCAxOjMyIEFNIEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4gd3JvdGU6DQo+PiBUaGlzIG1lbW9yeSBhbGxvY2F0aW9uIGZsYWcgd2lsbCBiZSB1c2Vk
IHRvIGluZGljYXRlIEJPcyBjb250YWluaW5nDQo+PiBzZW5zaXRpdmUgZGF0YSB0aGF0IHNob3Vs
ZCBub3QgYmUgbGVha2VkIHRvIG90aGVyIHByb2Nlc3Nlcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICBp
bmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCB8IDQgKysrKw0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0v
YW1kZ3B1X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgNCj4+IGluZGV4IDYx
ODcwNDc4YmM5Yy4uNTg2NTljMjhjMjZlIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS91YXBpL2Ry
bS9hbWRncHVfZHJtLmgNCj4+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oDQo+
PiBAQCAtMTMxLDYgKzEzMSwxMCBAQCBleHRlcm4gIkMiIHsNCj4+ICAgICogZm9yIHRoZSBzZWNv
bmQgcGFnZSBvbndhcmQgc2hvdWxkIGJlIHNldCB0byBOQy4NCj4+ICAgICovDQo+PiAgICNkZWZp
bmUgQU1ER1BVX0dFTV9DUkVBVEVfTVFEX0dGWDkgICAgICAgICAgICAgKDEgPDwgOCkNCj4+ICsv
KiBGbGFnIHRoYXQgQk8gbWF5IGNvbnRhaW4gc2Vuc2l0aXZlIGRhdGEgdGhhdCBtdXN0IGJlIGNs
ZWFyZWQgYmVmb3JlDQo+PiArICogcmVsZWFzaW5nIHRoZSBtZW1vcnkNCj4+ICsgKi8NCj4+ICsj
ZGVmaW5lIEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1fU0VOU0lUSVZFICAgICAgICgxIDw8IDkpDQo+
IElmIHdlIGRlY2lkZSB0byBnbyB0aGlzIHJvdXRlLCBJJ2QgbGlrZSB0byBtYWtlIHRoaXMgZmxh
ZyBtb3JlIGV4cGxpY2l0LiAgRS5nLiwNCj4NCj4gQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DTEVB
Ul9PTl9GUkVFDQoNCkl0J3MgbW9yZSB0aGFuIGp1c3QgY2xlYXIgb24gZnJlZS4gTWVtb3J5IG5l
ZWRzIHRvIGdldCBjbGVhcmVkIHdoZW5ldmVyIA0KdGhlIGJhY2tpbmcgcGh5c2ljYWwgbWVtb3J5
IGdldHMgcmVsZWFzZWQgdG8gYmUgcmV1c2VkIGJ5IG90aGVyIA0KcHJvY2Vzc2VzLiBUaGF0IGNh
biBiZSBiZWNhdXNlIG9mIGEgZnJlZSwgb3IgYmVjYXVzZSB0aGUgYnVmZmVyIG1vdmVkLCANCm9y
IGJlY2F1c2UgaXQgd2FzIGV2aWN0ZWQuDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KDQo+DQo+
IEFsZXgNCj4NCj4+ICAgc3RydWN0IGRybV9hbWRncHVfZ2VtX2NyZWF0ZV9pbiAgew0KPj4gICAg
ICAgICAgLyoqIHRoZSByZXF1ZXN0ZWQgbWVtb3J5IHNpemUgKi8NCj4+IC0tDQo+PiAyLjE3LjEN
Cj4+DQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
