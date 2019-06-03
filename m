Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCB032A71
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 10:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9688915F;
	Mon,  3 Jun 2019 08:07:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700073.outbound.protection.outlook.com [40.107.70.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F088915F
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 08:07:34 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3439.namprd12.prod.outlook.com (20.178.243.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 08:07:33 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b828:da4:7aaf:485f]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b828:da4:7aaf:485f%3]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 08:07:33 +0000
From: "Cui, Flora" <fcui@amd.com>
To: =?utf-8?B?RXJuc3QgU2rDtnN0cmFuZA==?= <ernstp@gmail.com>
Subject: Re: [PATCH v2] dri2: reply to client for WaitMSC request in any case
Thread-Topic: [PATCH v2] dri2: reply to client for WaitMSC request in any case
Thread-Index: AQHVGd2iVZomUiDEbUapsCAJJL6lcaaJkOMAgAACJAA=
Date: Mon, 3 Jun 2019 08:07:33 +0000
Message-ID: <3af11f15-35ec-e17f-f536-a1c389cc0ff2@amd.com>
References: <1559111780-32513-1-git-send-email-flora.cui@amd.com>
 <bc4571fc-6521-74d7-2d5c-1665396b50fc@amd.com>
 <CAD=4a=VXK_2yt1S-FFMucFGxjG7M3-cE6rxi7qP=2qe8p1WSkw@mail.gmail.com>
In-Reply-To: <CAD=4a=VXK_2yt1S-FFMucFGxjG7M3-cE6rxi7qP=2qe8p1WSkw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR03CA0083.apcprd03.prod.outlook.com
 (2603:1096:203:72::23) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a75b4589-50d0-441e-d05c-08d6e7fa87ea
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3439; 
x-ms-traffictypediagnostic: MN2PR12MB3439:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3439A9974016A19BC71B6726FA140@MN2PR12MB3439.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(39860400002)(346002)(366004)(396003)(189003)(199004)(478600001)(386003)(31686004)(7736002)(6506007)(8936002)(76176011)(316002)(6486002)(8676002)(71200400001)(64126003)(25786009)(229853002)(36756003)(81166006)(14444005)(71190400001)(81156014)(1411001)(305945005)(256004)(11346002)(102836004)(31696002)(2616005)(6436002)(476003)(6916009)(446003)(966005)(68736007)(65826007)(53936002)(6306002)(486006)(66574012)(14454004)(5660300002)(6512007)(65956001)(2906002)(65806001)(6246003)(3846002)(66066001)(54906003)(72206003)(26005)(6116002)(52116002)(99286004)(73956011)(186003)(66556008)(66946007)(66476007)(66446008)(64756008)(58126008)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3439;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fIQWNCYp/ud1exDEbYJm6zX0vfkJIXX3co4PWjQjQL+tYgX/rclXQ5g/atmL/zCxozROjfbNMARs+qD+P0uJ0i05QNPNJ0jI/6BGnDy4LYyYIyntXoWzNCnwZnnURK/h6B9O05zZKLl7Ub2wU+/HeruCGJQes7bJAKXscMaH6J5f9i9WQzh2R9Ff8u9bzR30iasKPnanAC+2Iy4YZfHhjcBE1ngJ1a9tN3/pJMD1TPWSh+6aVbuhvC7PMpDMQEKRTNWpQKRk3thKcAcPZJo9Fw9WArYK/7Gft1YOJxk5sSHKiPDZ137ZVoTJIyMr1+x9AINxptg1BT+0SZ8IqJgjTYIJxQsFPiDBhxdmWsoVU9571d7NkKHa8GAMkTWBOOHfdaTVViIkX/+9TXgglYSCjFRGIxYDSikE264WXrI0TeU=
Content-ID: <92336D8DA821294F8582EEA93798F62F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75b4589-50d0-441e-d05c-08d6e7fa87ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 08:07:33.1934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3439
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1JlazjRDP5q2BQ7LAWdSVZ4sVicJp+7UbAv4AVvor8=;
 b=aQkMWzPbpDLVNoCcUPZLOPClyMOmVblJPoYMj6kTgAzuJgV2UMnvUDE2P3kNH3moJwHpg+9SjCGcblnLl9DrS/o5eyw0M9nEKDiq+WY+E1RnQj/u0ICuxyyBUsNx8B0UlhQbHVTx66IU4nN4LXnyg3B2eY4jT04E/ZlYcByg+sY=
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>, "Daenzer,
 Michel" <Michel.Daenzer@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

WWVzLiBJdCdzIHYyIGFuZCBjaGFuZ2UgdGhlIGJlaGF2aW9yIHNsaWdodGx5Lg0KDQpJdCBzZW5k
IHJlcGx5IHRvIGNsaWVudCB3aXRoIG5vIHdhaXRfaW5mbyBmb3INCg0KYW1kZ3B1X2RyaTJfZGVm
ZXJyZWRfZXZlbnQoKSB3b3VsZCBoYW5kbGUgdGhlIHJlcGx5IGRpZmZlcmVudGx5Lg0KDQrlnKgg
Ni8zLzIwMTkgMzo1OSBQTSwgRXJuc3QgU2rDtnN0cmFuZCDlhpnpgZM6DQo+IFRoaXMgbG9va3Mg
bGlrZSBhIHYyIHdpdGggc2lsaWdodGx5IGRpZmZlcmVudCBzZW1hbnRpY3M/DQo+DQo+IERlbiBt
w6VuIDMganVuaSAyMDE5IGtsIDA5OjI2IHNrcmV2IEN1aSwgRmxvcmEgPGZjdWlAYW1kLmNvbT46
DQo+PiBwaW5nLi4uDQo+Pg0KPj4gY29tbWl0IDQ3NjEzZThlOGY0YTVlM2IyNTgzMGUzYzAxNWE0
YTIxN2ZjYmU0NjkNCj4+IEF1dGhvcjogRmxvcmEgQ3VpIDxmbG9yYS5jdWlAYW1kLmNvbT4NCj4+
IERhdGU6ICAgV2VkIE1heSAyOSAxNDoxODo1MCAyMDE5ICswODAwDQo+Pg0KPj4gICAgICAgZHJp
MjogcmVwbHkgdG8gY2xpZW50IGZvciBXYWl0TVNDIHJlcXVlc3QgaW4gYW55IGNhc2UNCj4+DQo+
PiAgICAgICBvdGhlcndpc2UgY2xpZW50IHdvdWxkIHdhaXQgZm9yIHJlcGx5IGZvcmV2ZXIgYW5k
IGRlc2t0b3AgYXBwZWFycyBoYW5nLg0KPj4NCj4+ICAgICAgIFNpZ25lZC1vZmYtYnk6IEZsb3Jh
IEN1aSA8ZmxvcmEuY3VpQGFtZC5jb20+DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3NyYy9hbWRncHVf
ZHJpMi5jIGIvc3JjL2FtZGdwdV9kcmkyLmMNCj4+IGluZGV4IDQ0MzE2YWMuLmJiM2Q5ZDAgMTAw
NjQ0DQo+PiAtLS0gYS9zcmMvYW1kZ3B1X2RyaTIuYw0KPj4gKysrIGIvc3JjL2FtZGdwdV9kcmky
LmMNCj4+IEBAIC0xMDYyLDYgKzEwNjIsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9kcmkyX3NjaGVk
dWxlX3dhaXRfbXNjKENsaWVudFB0cg0KPj4gY2xpZW50LCBEcmF3YWJsZVB0ciBkcmF3LA0KPj4g
ICAgb3V0X2NvbXBsZXRlOg0KPj4gICAgICAgICAgIGlmICh3YWl0X2luZm8pDQo+PiAgICAgICAg
ICAgICAgICAgICBhbWRncHVfZHJpMl9kZWZlcnJlZF9ldmVudChOVUxMLCAwLCB3YWl0X2luZm8p
Ow0KPj4gKyAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAgICAgRFJJMldhaXRNU0NDb21wbGV0
ZShjbGllbnQsIGRyYXcsIHRhcmdldF9tc2MsIDAsIDApOw0KPj4gKw0KPj4gICAgICAgICAgIHJl
dHVybiBUUlVFOw0KPj4gICAgfQ0KPj4NCj4+IOWcqCA1LzI5LzIwMTkgMjozNiBQTSwgQ3VpLCBG
bG9yYSDlhpnpgZM6DQo+Pj4gb3RoZXJ3aXNlIGNsaWVudCB3b3VsZCB3YWl0IGZvciByZXBseSBm
b3JldmVyIGFuZCBkZXNrdG9wIGFwcGVhcnMgaGFuZy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6
IEZsb3JhIEN1aSA8ZmxvcmEuY3VpQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4gICAgc3JjL2FtZGdw
dV9kcmkyLmMgfCAzICsrKw0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykN
Cj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9zcmMvYW1kZ3B1X2RyaTIuYyBiL3NyYy9hbWRncHVfZHJp
Mi5jDQo+Pj4gaW5kZXggNDQzMTZhYy4uMzQzNTNhNyAxMDA2NDQNCj4+PiAtLS0gYS9zcmMvYW1k
Z3B1X2RyaTIuYw0KPj4+ICsrKyBiL3NyYy9hbWRncHVfZHJpMi5jDQo+Pj4gQEAgLTEwNjIsNiAr
MTA2Miw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RyaTJfc2NoZWR1bGVfd2FpdF9tc2MoQ2xpZW50
UHRyIGNsaWVudCwgRHJhd2FibGVQdHIgZHJhdywNCj4+PiAgICBvdXRfY29tcGxldGU6DQo+Pj4g
ICAgICAgIGlmICh3YWl0X2luZm8pDQo+Pj4gICAgICAgICAgICAgICAgYW1kZ3B1X2RyaTJfZGVm
ZXJyZWRfZXZlbnQoTlVMTCwgMCwgd2FpdF9pbmZvKTsNCj4+PiArDQo+Pj4gKyAgICAgRFJJMldh
aXRNU0NDb21wbGV0ZShjbGllbnQsIGRyYXcsIHRhcmdldF9tc2MsIDAsIDApOw0KPj4+ICsNCj4+
PiAgICAgICAgcmV0dXJuIFRSVUU7DQo+Pj4gICAgfQ0KPj4+DQo+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QN
Cj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
