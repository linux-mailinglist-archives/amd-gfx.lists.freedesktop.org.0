Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF964706
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 15:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BA489561;
	Wed, 10 Jul 2019 13:32:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710054.outbound.protection.outlook.com [40.107.71.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C23989561
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 13:32:35 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Wed, 10 Jul 2019 13:32:33 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4%6]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 13:32:33 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: Intermittent errors when using amdgpu_job_submit_direct
Thread-Topic: Intermittent errors when using amdgpu_job_submit_direct
Thread-Index: AQHVNhJBsDnJQXPLAkeGgQebgEnuI6bCP7YAgABsjYCAAS9XgA==
Date: Wed, 10 Jul 2019 13:32:33 +0000
Message-ID: <c5f387a3-e1cf-6894-b7d0-19a9a26fa172@amd.com>
References: <885956af-be59-d218-f2e7-a0fc06042f21@amd.com>
 <affc1656-4696-846e-baca-48331aef3043@amd.com>
 <bcaf471b-bc25-02c0-4547-b756bbf42bf6@amd.com>
In-Reply-To: <bcaf471b-bc25-02c0-4547-b756bbf42bf6@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0174.apcprd02.prod.outlook.com
 (2603:1096:201:1f::34) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [101.86.234.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef786205-9935-4a7c-1640-08d7053b103f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3054; 
x-ms-traffictypediagnostic: MN2PR12MB3054:
x-microsoft-antispam-prvs: <MN2PR12MB3054CD9D3E09A6DEFF8EF7ECB4F00@MN2PR12MB3054.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(189003)(199004)(68736007)(6486002)(31686004)(478600001)(186003)(6512007)(31696002)(110136005)(229853002)(66446008)(6436002)(2501003)(316002)(6246003)(26005)(7736002)(53936002)(102836004)(76176011)(386003)(53546011)(66066001)(6506007)(2906002)(25786009)(11346002)(99286004)(71190400001)(36756003)(446003)(5660300002)(476003)(6116002)(486006)(14454004)(2616005)(64756008)(66476007)(256004)(66556008)(66946007)(81166006)(305945005)(8676002)(52116002)(81156014)(8936002)(3846002)(14444005)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3054;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +VpK2Z0qUF5NlOeekKuLrTLF1UqITwBJgav64bGmarQT5LWIZCTfTOdd1MMMW0yDtkMZdhb2fy+tXlEPoclbjnK4SbEPJ2F8uYx5KrI8YmxTA2+NdwpnkaXhzBd+SVJvWxy+95nNyN65bJrmATUaWPAajrR+776KaCfCKQgILxapHC8EVcll0UcxP7EwMDHQyT219c5w98FohN9Rp9fRi9o/3iLTwvzHAI4Gfg/nLR5MSHjQqRJu6TnXYe/8XQwQ00yhmv29V//OJ1UA3VpmOul/NnqP4PE3NvP1kDzLygfQvCG2IC/VCNJ2mYXq936fbKCK6XXNQ90RdeiHa05jm1wf6IdbnjIXCfK+eq5GdEkBRfHEgwwyeef+vrHwwfV+6MIi2wM6qyaRTEf8Z+LjGzCA0zD/YeWVzkaZkdhYH3c=
Content-ID: <6A5123AB78A3514ABD1C9D0C72B503F7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef786205-9935-4a7c-1640-08d7053b103f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 13:32:33.4311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2pWuYyhxM77rYlRxAYVb7eQy8vHhshABmnGxZCDieE=;
 b=s42drFjg8l3WHUwSIbIYVQc6nm5/qILUSFM2aUKxhZv/prSrS6WpvYVzjs7TB7vBL4jOo5ViDXJZpmFb4JkMal/Riv6KHt0WUnFQGyudVVrKD28AuPikc/sPwXetiMGlaOnWT26P+pb2yQ14TyfZWYzj5au0pVKzfyHV15mppgg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

DQrlnKggMjAxOS83LzEwIDM6MjYsIEt1ZWhsaW5nLCBGZWxpeCDlhpnpgZM6DQo+IE9uIDIwMTkt
MDctMDkgODo1OCBhLm0uLCBaaG91LCBEYXZpZChDaHVuTWluZykgd3JvdGU6DQo+PiBJJ3ZlIHJh
aXNlZCBpdCB1cCB3aGVuIENocmlzdGlhbiBtYWtlIHBhZ2UgZmF1bHQsIGF0IHRoYXQgcGF0Y2gs
DQo+PiBhbWRncHVfam9iX3N1Ym1pdF9kaXJlY3QgdXNlcyBleGNsdXNpdmUgcGFnZSBmYXVsdCBy
aW5nIGZvciB0aGF0Lg0KPj4NCj4+IEJ1dCBpZiB5b3UgdXNlIGFtZGdwdV9qb2Jfc3VibWl0X2Rp
cmVjdCBmb3IgZ2VybmVyYWwgcmluZ3Mgb2N1cHBpZWQgYnkNCj4+IHNjaGVkdWxlciwgSSBndWVz
cyB2YXJpYXMgYnVncyB3aWxsIGhhcHBlbi4NCj4gVGhlIHByb2JsZW0gaXMsIGV2ZW4gdGhlIHBh
Z2luZyByaW5nIGlzIHVzZWQgYnkgdGhlIHNjaGVkdWxlci4gVGhlcmUgYXJlDQo+IHNldmVyYWwg
cGxhY2VzIHdoZXJlIGJ1ZmZlciBvcGVyYXRpb25zIGFyZSBzdWJtaXR0ZWQgdG8gdGhlIHBhZ2lu
ZyByaW5nDQo+IHRocm91Z2ggdGhlIHNjaGVkdWxlci4gVGhhdCBtYWtlcyBhbnkgdXNlIG9mIHRo
ZSBwYWdpbmcgcmluZyB0aHJvdWdoDQo+IGRpcmVjdCBzdWJtaXNzaW9uIHByb2JsZW1hdGljLg0K
Pg0KPiBFdmVuIGlnbm9yaW5nIHRoZSBzY2hlZHVsZXIsIGlmIGl0J3MgcG9zc2libGUgdGhhdCBt
dWx0aXBsZSB0aHJlYWRzDQo+IHN1Ym1pdCB0byB0aGUgcGFnaW5nIHJpbmcsIHdlJ2xsIG5lZWQg
bG9ja2luZyB0byBlbnN1cmUgdGhhdCB0aGUNCj4gY29udGVudHMgb2YgdGhlIHJpbmcgcmVtYWlu
IGNvbnNpc3RlbnQuIElJUkMsIHRoZSByaW5ncyB1c2VkIHRvIGhhdmUNCj4gbG9ja2luZyBiZWZv
cmUgd2UgaGFkIGEgR1BVIHNjaGVkdWxlci4gRm9yIGNvbXBhcmlzb24sIHNlZQ0KPiByYWRlb25f
cmluZy5jLCB3aGljaCBzdGlsbCBoYXMgbG9ja2luZy4gV2l0aCB0aGUgR1BVIHNjaGVkdWxlciwg
dGhlDQo+IHJpbmdzIGJlY2FtZSBzaW5nbGUtcHJvZHVjZXIgcXVldWVzIHRoYXQgbm8gbG9uZ2Vy
IG5lZWRlZCBsb2NraW5nLiBCdXQNCj4gd2l0aCBkaXJlY3Qgc3VibWlzc2lvbiB0aGF0IGlzIG5v
IGxvbmdlciB0cnVlLiBJIHRoaW5rIGEgZ29vZCBwbGFjZSB0bw0KPiBkbyB0aGF0IGxvY2tpbmcg
bm93IHdvdWxkIGJlIGluIGFtZGdwdV9pYl9zY2hlZHVsZS4NCg0KWWVzLCBUaGF0IGlzIGV4YWN0
IHJlYXNvbiB3aHkgd2UgcmVtb3ZlIHJpbmcgbG9jayBhdCB0aGF0IG1vbWVudC4NCg0KWW91IGNh
biBhZGQgYmFjayBpdCB3aGVuIHVzaW5nIHN1Ym1pdF9kaXJlY3QgY28tZXhpc3Rpbmcgd2l0aCBz
Y2hlZHVsZXIuDQoNCi1EYXZpZA0KDQo+DQo+IFJlZ2FyZHMsDQo+ICAgwqAgRmVsaXgNCj4NCj4N
Cj4+IC1EYXZpZA0KPj4NCj4+IOWcqCAyMDE5LzcvOSAxMjo1MywgS3VlaGxpbmcsIEZlbGl4IOWG
memBkzoNCj4+PiBJJ20gc2VlaW5nIHNvbWUgd2VpcmQgaW50ZXJtaXR0ZW50IGJ1Z3MgKHZtIGZh
dWx0cywgaGFuZ3MsIGV0Yykgd2hlbg0KPj4+IHRyeWluZyB0byB1c2UgYW1kZ3B1X2pvYl9zdWJt
aXRfZGlyZWN0LiBJJ20gd29uZGVyaW5nIGlmIHRoZXJlIGlzIGENCj4+PiBwb3NzaWJpbGl0eSBv
ZiBhIHJhY2UgY29uZGl0aW9uLCB3aGVuIGEgc3VibWl0X2RpcmVjdCBhbmQgYSBHUFUNCj4+PiBz
Y2hlZHVsZXIgdGhyZWFkIHRyeSB0byBzdWJtaXQgdG8gdGhlIHNhbWUgcmluZyBhdCB0aGUgc2Ft
ZSB0aW1lLiBJDQo+Pj4gZGlkbid0IHNlZSBhbnkgbG9ja2luZyB0byBhbGxvdyBtdWx0aXBsZSB0
aHJlYWRzIHNhZmVseSBzdWJtaXR0aW5nIHRvDQo+Pj4gdGhlIHNhbWUgcmluZy4NCj4+Pg0KPj4+
IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQo+Pj4NCj4+PiBUaGFua3MsDQo+Pj4gICAgIMKgIEZl
bGl4DQo+Pj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
