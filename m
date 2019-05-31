Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE45C31461
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 20:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C65A89823;
	Fri, 31 May 2019 18:05:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750080.outbound.protection.outlook.com [40.107.75.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACA789823
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 18:05:23 +0000 (UTC)
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0087.namprd12.prod.outlook.com (10.172.77.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.22; Fri, 31 May 2019 18:05:22 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3%10]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 18:05:22 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Add back missing hw translate init for
 DCN1_01
Thread-Topic: [PATCH] drm/amd/display: Add back missing hw translate init for
 DCN1_01
Thread-Index: AQHVF8qw8hokq+50jka7d2qndhsDgaaFhxKA
Date: Fri, 31 May 2019 18:05:22 +0000
Message-ID: <90dc7bf2-3886-0572-3046-8903bdc83146@amd.com>
References: <20190531160526.28279-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190531160526.28279-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::45) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa60dc38-12d5-4dd0-953f-08d6e5f28c13
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0087; 
x-ms-traffictypediagnostic: CY4PR1201MB0087:
x-microsoft-antispam-prvs: <CY4PR1201MB0087EA66A2F2B102DCBA47718C190@CY4PR1201MB0087.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(366004)(376002)(396003)(199004)(189003)(2906002)(66556008)(11346002)(2616005)(486006)(66476007)(446003)(65806001)(65956001)(31696002)(6246003)(476003)(5660300002)(72206003)(25786009)(66066001)(73956011)(64756008)(14454004)(53936002)(81156014)(66946007)(478600001)(66446008)(99286004)(8936002)(4326008)(8676002)(81166006)(76176011)(64126003)(65826007)(71190400001)(71200400001)(386003)(53546011)(6506007)(7736002)(256004)(31686004)(110136005)(102836004)(52116002)(36756003)(6116002)(3846002)(229853002)(58126008)(305945005)(26005)(186003)(6436002)(6512007)(2501003)(68736007)(6486002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0087;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pcfmdeBwpzUSuxbL2U7xxFmlKEWGBqPZfZ8nuAVvkizizTvbzdSklLHaFvZUx3uKsL6WwdDvVp0bxOQ7/NjkJOnO9/3vj8Ea1JAgyo0ZLBIhKYt0j0rC+BQbFgHhnayPXa/nsz/ZxNHu9eKMsnwbDzM8+TEbjvAQMEGfB3yToMuqBrR66BUqELK3QvRJ06FZAFiD+Xoc76U70MD3EAO5w/Gy1OiRcCku2ov60QT7gAaobO1zQQ9756TZrsMd2NsNLBh7s82HARMty6RIdG7u11/gE+w8D3XNitvHFe2JqIYF+RAcZb8/3uTUrfLwleCCQYd8EtSBB0FsFgTveHBs4D4EhUKgBObyd/XK52ImwEl7DKQVhmYZtWRJvC1LgEE8ZrRO0MQw3GzsCADeT/8Vj0DRWH+IsBSzBQEUSFCx/z0=
Content-ID: <D2B0E61B6F23B0429D751D86ADE6FB4D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa60dc38-12d5-4dd0-953f-08d6e5f28c13
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 18:05:22.0619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwentlan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0087
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bk8n9mLLPPuZ4Dx1m0wudEJQOsGuPKgRobHQzQGjGC8=;
 b=QBhsyvkt2QOc2kfeSB3Giw7WW9hGoyfqBBS/d2yDrOEgdY3Un7wDYUWWGcWp3bKHdqTRHBTE3M1XBVuyYVeY03rtSNRhVfyOsPa8h1qL0HIJdP/3NnXXPuT9J8x4UDEClk5rw7T4L3vgxbck6ym4egBdCkq148+wVsFPr46JB5Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0zMSAxMjowNSBwLm0uLCBOaWNob2xhcyBLYXpsYXVza2FzIHdyb3RlOg0KPiBb
V2h5XQ0KPiBEQ05fVkVSU0lPTl8xXzAxIGlzIG5vIGxvbmdlciBoYW5kbGVkIGluIHRoZSBkYWxf
aHdfdHJhbnNsYXRlX2luaXQNCj4gc3dpdGNoIHNpbmNlIGl0IHdhcyBpbmFkdmVydGVudGx5IGRy
b3BwZWQgaW4gdGhlIHBhdGNoIHRoYXQgcmVtb3ZlZCB0aGUNCj4gdW5uZWNlc3NhcnkgRENOMV8w
MSBndWFyZHMuDQo+IA0KPiBUaGlzIGNhdXNlZCBudW1lcm91cyByZWdyZXNzaW9ucyBvbiBEQ04x
XzAxIHdoZW4gbG9hZGluZyB0aGUgZHJpdmVyLg0KPiANCj4gW0hvd10NCj4gQWRkIGl0IGJhY2su
DQo+IA0KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQo+IEZp
eGVzOiA5N2RmNDI0ZmU3YTcgKCJkcm0vYW1kL2Rpc3BsYXk6IERyb3AgRENOMV8wMSBndWFyZHMi
KQ0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVz
a2FzQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxh
bmRAYW1kLmNvbT4NCg0KSGFycnkNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9ncGlvL2h3X3RyYW5zbGF0ZS5jIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZ3Bpby9od190cmFuc2xhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9ncGlvL2h3X3RyYW5zbGF0ZS5jDQo+IGluZGV4IDc3NjE1MTQ2Yjk2ZS4uMWY5ODMzZGM4Y2Zl
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9od190
cmFuc2xhdGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9o
d190cmFuc2xhdGUuYw0KPiBAQCAtODEsNiArODEsNyBAQCBib29sIGRhbF9od190cmFuc2xhdGVf
aW5pdCgNCj4gIAkJcmV0dXJuIHRydWU7DQo+ICAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9E
Q19EQ04xXzApDQo+ICAJY2FzZSBEQ05fVkVSU0lPTl8xXzA6DQo+ICsJY2FzZSBEQ05fVkVSU0lP
Tl8xXzAxOg0KPiAgCQlkYWxfaHdfdHJhbnNsYXRlX2RjbjEwX2luaXQodHJhbnNsYXRlKTsNCj4g
IAkJcmV0dXJuIHRydWU7DQo+ICAjZW5kaWYNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
