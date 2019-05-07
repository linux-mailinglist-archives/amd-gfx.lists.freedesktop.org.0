Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE3B169A0
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 19:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3756E815;
	Tue,  7 May 2019 17:54:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800049.outbound.protection.outlook.com [40.107.80.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A862C6E815
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 17:54:09 +0000 (UTC)
Received: from BYAPR12MB3384.namprd12.prod.outlook.com (20.178.55.225) by
 BYAPR12MB3605.namprd12.prod.outlook.com (20.178.197.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 17:54:05 +0000
Received: from BYAPR12MB3384.namprd12.prod.outlook.com
 ([fe80::7496:be8b:650:d66a]) by BYAPR12MB3384.namprd12.prod.outlook.com
 ([fe80::7496:be8b:650:d66a%4]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 17:54:05 +0000
From: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/amdgpu: Reserve shared fence for eviction fence
Thread-Topic: [PATCH 1/1] drm/amdgpu: Reserve shared fence for eviction fence
Thread-Index: AQHVBEmda5QLQ2HsJUSH1oPwP2wb+aZf8xmA
Date: Tue, 7 May 2019 17:54:05 +0000
Message-ID: <92039006-8620-22dc-2320-3cb46263d8f5@amd.com>
References: <20190506202331.7456-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190506202331.7456-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To BYAPR12MB3384.namprd12.prod.outlook.com
 (2603:10b6:a03:a9::33)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9512ff4c-1544-4d2a-6fd7-08d6d314fed6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3605; 
x-ms-traffictypediagnostic: BYAPR12MB3605:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB36056BA0F69B765F15B79CAF8C310@BYAPR12MB3605.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(136003)(39860400002)(346002)(199004)(189003)(26005)(186003)(476003)(99286004)(6512007)(486006)(25786009)(229853002)(6486002)(53546011)(6506007)(386003)(76176011)(52116002)(14454004)(6246003)(64126003)(2616005)(102836004)(11346002)(446003)(65956001)(7736002)(66066001)(65806001)(5660300002)(305945005)(65826007)(478600001)(81156014)(31686004)(81166006)(53936002)(8676002)(2501003)(6436002)(316002)(68736007)(6306002)(58126008)(8936002)(110136005)(966005)(36756003)(14444005)(73956011)(31696002)(2906002)(256004)(66556008)(66476007)(72206003)(66946007)(64756008)(66446008)(71190400001)(3846002)(6116002)(86362001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3605;
 H:BYAPR12MB3384.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /Os0WdQrJbaStHI76S+ntGVT+uWoQRwQ4olftHp/LFRW2TxK06JfDDNTe7u6ngOITie1CQ/tEKuPCKEoDs/v2LfVK3E18uzR/ADNLk9dX+zFWG+WUUGo5Ql3m31lq8ccgQXhVCU4mj+rz99wl9uk9E9zH+olx0+Iua/EHsul1s04W4GKjsVy4z2JzbvxLByZi0pR92BTL7ZRhGQjH3WTNi/tVtbdQwJkumHi87/d4/rwzn11HNxpiJiWrfrdGigOQ3W+sIWyYRf0KeLnwsKJM5YeFfkD78TWa/GgO10Nrmx/IeRXjJPuS7KeMnFXdnAZ0uq8ak5NSON9A4MEi2axFaxQvZ9aXy5x7H5YjYJU985zCtGvdR7TtZJnP8dpgDBSpqA935NSfXNW/RQufZYcnSYa1h/gC+r9+GJKATfYawM=
Content-ID: <4A70C08632BEE24C8BFA2FA6A3EB991A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9512ff4c-1544-4d2a-6fd7-08d6d314fed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 17:54:05.1379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3605
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+u9XGQFwwhnxc/3ns61Wmma+76c8JKH2LziZG4rRjk=;
 b=4krmmasDBpqfGJbbIKYuty6HeB/aCYsuE8dqRumga5cp9LltKXCr2CQt2VkH1+yP/tZiXIr2XIMpmItuHZ8/sm/ITXfWPPOwR45rjNY3+lPaRXAq+sRo1CCpsXGDegO4UnCEXYSFZMj8DvXkSeTQJTnLnJzHHWofwUQGsSf1qsI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harish.Kasiviswanathan@amd.com; 
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

UmV2aWV3ZWQtYnk6IEhhcmlzaCBLYXNpdmlzd2FuYXRoYW4gPEhhcmlzaC5LYXNpdmlzd2FuYXRo
YW5AYW1kLmNvbT4NCg0KDQpPbiAyMDE5LTA1LTA2IDQ6MjMgcC5tLiwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOg0KPiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQo+DQo+IE5lZWQgdG8gcmVzZXJ2
ZSBzcGFjZSBmb3IgdGhlIHNoYXJlZCBldmljdGlvbiBmZW5jZSB3aGVuIGluaXRpYWxpemluZw0K
PiBhIEtGRCBWTS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZF9ncHV2bS5jIHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMNCj4gaW5kZXggMjBjZjhlMWU3NDQ1Li5lMWNhZTRhMzcxMTMgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMN
Cj4gQEAgLTg3NSw2ICs4NzUsOSBAQCBzdGF0aWMgaW50IGluaXRfa2ZkX3ZtKHN0cnVjdCBhbWRn
cHVfdm0gKnZtLCB2b2lkICoqcHJvY2Vzc19pbmZvLA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQU1ER1BVX0ZFTkNFX09XTkVSX0tGRCwgZmFsc2UpOw0KPiAgICAgICAgIGlm
IChyZXQpDQo+ICAgICAgICAgICAgICAgICBnb3RvIHdhaXRfcGRfZmFpbDsNCj4gKyAgICAgICBy
ZXQgPSByZXNlcnZhdGlvbl9vYmplY3RfcmVzZXJ2ZV9zaGFyZWQodm0tPnJvb3QuYmFzZS5iby0+
dGJvLnJlc3YsIDEpOw0KPiArICAgICAgIGlmIChyZXQpDQo+ICsgICAgICAgICAgICAgICBnb3Rv
IHJlc2VydmVfc2hhcmVkX2ZhaWw7DQo+ICAgICAgICAgYW1kZ3B1X2JvX2ZlbmNlKHZtLT5yb290
LmJhc2UuYm8sDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICZ2bS0+cHJvY2Vzc19pbmZvLT5l
dmljdGlvbl9mZW5jZS0+YmFzZSwgdHJ1ZSk7DQo+ICAgICAgICAgYW1kZ3B1X2JvX3VucmVzZXJ2
ZSh2bS0+cm9vdC5iYXNlLmJvKTsNCj4gQEAgLTg4OCw2ICs4OTEsNyBAQCBzdGF0aWMgaW50IGlu
aXRfa2ZkX3ZtKHN0cnVjdCBhbWRncHVfdm0gKnZtLCB2b2lkICoqcHJvY2Vzc19pbmZvLA0KPg0K
PiAgICAgICAgIHJldHVybiAwOw0KPg0KPiArcmVzZXJ2ZV9zaGFyZWRfZmFpbDoNCj4gIHdhaXRf
cGRfZmFpbDoNCj4gIHZhbGlkYXRlX3BkX2ZhaWw6DQo+ICAgICAgICAgYW1kZ3B1X2JvX3VucmVz
ZXJ2ZSh2bS0+cm9vdC5iYXNlLmJvKTsNCj4gLS0NCj4gMi4xNy4xDQo+DQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBs
aXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
