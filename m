Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF63B1554
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 22:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A1A6EE20;
	Thu, 12 Sep 2019 20:22:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740083.outbound.protection.outlook.com [40.107.74.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF63A6EE20
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 20:22:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuxU4rmWaJO5eVbzB2+PfkGEl9lvkV7b5hS7mVTpn6CX+6vgYySCCXFrr48fX9XPFcZc+HHqcjnlknGZS+i1i04afLHycGfxmvlUBhubZdWQTG0nnlG/ptIzqf04Yr/qUfQVZ2L8BPKwF68Jr67ETu8DxDZELg3LNixjOCIlU5PSt9zVGMhMF1EBYb2yrEs5JOOIWPBulCaXHDh0NdRpcsqXMdONOVL+jqmRbPsoCJNAZt6CkuP0kB1XVRx0tcJseLokBTMum9/GgaVpUWFYIpsEifQlBBSmj4G+WxVzuzyNG9TRDInLb8cNQdoUnibfY9m0zRQPrWA6YOszZvsA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6l/VhTPk2E6wnJ/o7pFf/06wgj5TFoPnIrK0rt0Rn3U=;
 b=Twq0W1MTAmPQHF+O8ONd+UCE2tJ+lYZ9rFFpQEseFjT0bhRZcjg3Em4FcVaSte2hKcnn60TviEr1VuVl4YWAl230FLZ/ugbd2sDzixc7jCLVy1IZNRqjpn9dfoyrn1dDrPPZRNUAyjaUYoT9JnvsQoB1x+L17YAbUevUu6KTm1Uw4yf0hYkDzZfDXhp+3QiYYk2w3JOpFlHvhpE2MKGftyxha0UhbqYHzytax5cNeBqF8CzSWHQLKJ2+qk53gtwG4T8N5recp+qc6qQzgE5VvzV1Az0Oyd1mCP8+Bxe2LgA1FrEq4N4S7Tl34ktehqiEOEZcZbc1nJLJSFQR0MxnSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB2716.namprd12.prod.outlook.com (20.176.116.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Thu, 12 Sep 2019 20:21:59 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd%7]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 20:21:59 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "Cornwall, Jay" <Jay.Cornwall@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Swap trap temporary registers in gfx10 trap
 handler
Thread-Topic: [PATCH] drm/amdkfd: Swap trap temporary registers in gfx10 trap
 handler
Thread-Index: AQHVaZ4YtgmEUPuUwUymL939T39xO6cofCwA
Date: Thu, 12 Sep 2019 20:21:59 +0000
Message-ID: <1645e50b-37b0-964b-efcc-8e842e1a4e72@amd.com>
References: <1568315563-26870-1-git-send-email-jay.cornwall@amd.com>
In-Reply-To: <1568315563-26870-1-git-send-email-jay.cornwall@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::42) To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 238764cc-8218-4e13-3afc-08d737bedd67
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2716; 
x-ms-traffictypediagnostic: DM6PR12MB2716:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2716071390BCB1D61BE7E883F4B00@DM6PR12MB2716.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:245;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(189003)(199004)(64756008)(476003)(6506007)(81156014)(8676002)(81166006)(446003)(386003)(26005)(52116002)(6486002)(76176011)(11346002)(478600001)(7736002)(8936002)(58126008)(110136005)(486006)(2616005)(305945005)(316002)(14454004)(256004)(65956001)(65806001)(5660300002)(66066001)(71190400001)(71200400001)(66946007)(25786009)(36756003)(6246003)(6436002)(53936002)(186003)(229853002)(6116002)(3846002)(102836004)(53546011)(99286004)(2906002)(66446008)(66556008)(31696002)(2501003)(86362001)(31686004)(6512007)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2716;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HQVTM8ih0xf6BFTzKdR6fjmXydwlFAvqnVcAPrVtNTD5PTDaDx61TnKvEXJBbdLOyEC/keenHDyR2eRcwlGXrwM+6g/GV3cr4MOFc8hTY7W7MHoDlDBITwPlFJi92Tn3E1nDYgGCuQcfz5hxng4dmUUEMVPq8bGz/w+YHpjmkNOeRmX9RSY5XRGx4M33k1K7/VRmw1gytniZCWAz93IyxUa0YQvFK1R0ycR2kCvwJjRY8LafQ2vbr5PEzgQyO3cO/Lmzki4V+F9kW2bv+dg5uaVBNxrENofJMYDBzwCN4UV02An+Y/poQWrdAt9HWPo1mCVob+u+p+pOGCjhyUa3op6Oy1V66rYmHnpzTzN4OFwrCW2J/zETQEPUZkAYijzAMA5lhyW5k2+a3CckzqmTOA==
Content-ID: <19763E15DDD6BE49A4CB17148603B274@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 238764cc-8218-4e13-3afc-08d737bedd67
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 20:21:59.6337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XCoAInv2cWals/TDGr8eDhzjQRE5k3B6jHbHTtKKmqfXnOkBQUtfmF+B5/rj+Wl/I+msnfHRCZ/vijvl7SXlTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6l/VhTPk2E6wnJ/o7pFf/06wgj5TFoPnIrK0rt0Rn3U=;
 b=ApjJ6iFprMtX8zYEVfa3x6hvaKA0zYY8HpYJCK5ceR/o9bRUa/XcbNexrC1BfU020iWtuYoUlhnFcK8A94HRWzxH6ldObNAnx6ideo/q+/3uR0vnrg+T2cdUlTrjFFt9Mq7FfrPVS0cscMisIeABQSGF27IQww8KPHYSr4AjHxY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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

UmV2aWV3ZWQgYnk6IHNoYW95dW4gbGl1IDxTaGFveXVuLmxpdUBhbWQuY29tPg0KDQpPbiAyMDE5
LTA5LTEyIDM6MTMgcC5tLiwgQ29ybndhbGwsIEpheSB3cm90ZToNCj4gdHRtcFs0OjVdIGhvbGQg
aW5mb3JtYXRpb24gdXNlZnVsIHRvIHRoZSBkZWJ1Z2dlci4gVXNlIHR0bXBbMTQ6MTVdDQo+IGlu
c3RlYWQsIGFsaWduaW5nIGltcGxlbWVudGF0aW9uIHdpdGggZ2Z4OSB0cmFwIGhhbmRsZXIuDQo+
DQo+IFNpZ25lZC1vZmYtYnk6IEpheSBDb3Jud2FsbCA8amF5LmNvcm53YWxsQGFtZC5jb20+DQo+
IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyLmgg
ICAgICAgICB8ICA2ICsrKy0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3Jf
dHJhcF9oYW5kbGVyX2dmeDEwLmFzbSB8IDEwICsrKysrLS0tLS0NCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlci5oDQo+IGluZGV4IGE4Y2Y4MmQuLjkw
MWZlMzUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJh
cF9oYW5kbGVyLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQvY3dzcl90cmFw
X2hhbmRsZXIuaA0KPiBAQCAtNjk0LDEwICs2OTQsMTAgQEAgc3RhdGljIGNvbnN0IHVpbnQzMl90
IGN3c3JfdHJhcF9nZngxMF9oZXhbXSA9IHsNCj4gICAJMHgwMDNmODAwMCwgMHg4ZjZmODk2ZiwN
Cj4gICAJMHg4ODc3NmY3NywgMHg4YTZlZmY2ZSwNCj4gICAJMHgwMjNmODAwMCwgMHhiOWVlZjgw
NywNCj4gLQkweGI5NzBmODEyLCAweGI5NzFmODEzLA0KPiAtCTB4OGZmMDg4NzAsIDB4ZjQwNTFi
YjgsDQo+ICsJMHhiOTdhZjgxMiwgMHhiOTdiZjgxMywNCj4gKwkweDhmZmE4ODdhLCAweGY0MDUx
YmJkLA0KPiAgIAkweGZhMDAwMDAwLCAweGJmOGNjMDdmLA0KPiAtCTB4ZjQwNTFjMzgsIDB4ZmEw
MDAwMDgsDQo+ICsJMHhmNDA1MWViZCwgMHhmYTAwMDAwOCwNCj4gICAJMHhiZjhjYzA3ZiwgMHg4
N2VlNmU2ZSwNCj4gICAJMHhiZjg0MDAwMSwgMHhiZTgwMjA2ZSwNCj4gICAJMHhiOTcxZjgwMywg
MHg4NzcxZmY3MSwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3
c3JfdHJhcF9oYW5kbGVyX2dmeDEwLmFzbSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3
c3JfdHJhcF9oYW5kbGVyX2dmeDEwLmFzbQ0KPiBpbmRleCAzNTk4NjIxLi5jZGFhNTIzIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlcl9n
ZngxMC5hc20NCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQvY3dzcl90cmFwX2hh
bmRsZXJfZ2Z4MTAuYXNtDQo+IEBAIC0xODcsMTIgKzE4NywxMiBAQCBMX0ZFVENIXzJORF9UUkFQ
Og0KPiAgIAkvLyBSZWFkIHNlY29uZC1sZXZlbCBUQkEvVE1BIGZyb20gZmlyc3QtbGV2ZWwgVE1B
IGFuZCBqdW1wIGlmIGF2YWlsYWJsZS4NCj4gICAJLy8gdHRtcFsyOjVdIGFuZCB0dG1wMTIgY2Fu
IGJlIHVzZWQgKG90aGVycyBob2xkIFNQSS1pbml0aWFsaXplZCBkZWJ1ZyBkYXRhKQ0KPiAgIAkv
LyB0dG1wMTIgaG9sZHMgU1FfV0FWRV9TVEFUVVMNCj4gLQlzX2dldHJlZ19iMzIJdHRtcDQsIGh3
cmVnKEhXX1JFR19TSEFERVJfVE1BX0xPKQ0KPiAtCXNfZ2V0cmVnX2IzMgl0dG1wNSwgaHdyZWco
SFdfUkVHX1NIQURFUl9UTUFfSEkpDQo+IC0Jc19sc2hsX2I2NAlbdHRtcDQsIHR0bXA1XSwgW3R0
bXA0LCB0dG1wNV0sIDB4OA0KPiAtCXNfbG9hZF9kd29yZHgyCVt0dG1wMiwgdHRtcDNdLCBbdHRt
cDQsIHR0bXA1XSwgMHgwIGdsYzoxCQkvLyBzZWNvbmQtbGV2ZWwgVEJBDQo+ICsJc19nZXRyZWdf
YjMyCXR0bXAxNCwgaHdyZWcoSFdfUkVHX1NIQURFUl9UTUFfTE8pDQo+ICsJc19nZXRyZWdfYjMy
CXR0bXAxNSwgaHdyZWcoSFdfUkVHX1NIQURFUl9UTUFfSEkpDQo+ICsJc19sc2hsX2I2NAlbdHRt
cDE0LCB0dG1wMTVdLCBbdHRtcDE0LCB0dG1wMTVdLCAweDgNCj4gKwlzX2xvYWRfZHdvcmR4Mglb
dHRtcDIsIHR0bXAzXSwgW3R0bXAxNCwgdHRtcDE1XSwgMHgwIGdsYzoxCQkvLyBzZWNvbmQtbGV2
ZWwgVEJBDQo+ICAgCXNfd2FpdGNudAlsZ2ttY250KDApDQo+IC0Jc19sb2FkX2R3b3JkeDIJW3R0
bXA0LCB0dG1wNV0sIFt0dG1wNCwgdHRtcDVdLCAweDggZ2xjOjEJCS8vIHNlY29uZC1sZXZlbCBU
TUENCj4gKwlzX2xvYWRfZHdvcmR4MglbdHRtcDE0LCB0dG1wMTVdLCBbdHRtcDE0LCB0dG1wMTVd
LCAweDggZ2xjOjEJCS8vIHNlY29uZC1sZXZlbCBUTUENCj4gICAJc193YWl0Y250CWxna21jbnQo
MCkNCj4gICAJc19hbmRfYjY0CVt0dG1wMiwgdHRtcDNdLCBbdHRtcDIsIHR0bXAzXSwgW3R0bXAy
LCB0dG1wM10NCj4gICAJc19jYnJhbmNoX3NjYzAJTF9OT19ORVhUX1RSQVAJCQkJCQkvLyBzZWNv
bmQtbGV2ZWwgdHJhcCBoYW5kbGVyIG5vdCBiZWVuIHNldA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
