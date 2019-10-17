Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF56DB30A
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 19:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D726A6E040;
	Thu, 17 Oct 2019 17:13:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680060.outbound.protection.outlook.com [40.107.68.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209956E040
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 17:13:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ar3RUVB3/2RSI+VtJNiUk7Md8Lm2fzwGftUOWnpOko1muxH3KS1CEaBnT0tt2uqXdYi+VQP9qTqfPRC2PENo9t5W6229fNbz9Zvv9iwjIFyPttbDl8fxeAplvPREu0rIlzUJI/Svt/7SCwr+PnBW41D1lvuvXJVqYYNrW0gzyQYN1utcVTg84TFldys9HGcIygisk6ld/VTZ7HC1FuttStsgwjPmcgzPDSoJc60Dse7L4MF0c6r5tDD9WNZ2eUv5JJKXIixRXeLgKZiPzzd0mH5jhA2N/7xeLZneOdS8LRBPCwqOOIqDXxV2nMrDtOWoLW+oP9OuY8zxaEGjKKHZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JhHQH6MmH/W8iJBZRZVDDCABSHL60BfNzeaO419vqc=;
 b=BJ6rJm9zV+r7ZaWM8/DQY/FYCFgb4Txoy3s/Pm757MnNiS+rtXlvS+p0qlpyCkK6M3PxZcadw/jnZWC7h8aqSApPiwh0QRcMV8GUVms7e/y2CefUqPo5uuINfw7tkARpTTSuoQr8ocEYtz6hTuxzVWq9FXPkC+3LYINc8EzBef05tvyvF8+32AfAoVPQSm0OAydj6jOvWb5eZgNbc0ixeyC9ziGXafCBcNJTzb62gT0V9yjQfZB7sVqS7RJNZOC+13lnhnROIgbrj6Gbso6VsR/nzdoCe4WJ0x3HCdWljzJH+Qq14A8IbGt78VbYK6hxjvCsHsiE7IyvpEdUk+e3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2536.namprd12.prod.outlook.com (52.132.140.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 17:13:11 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.023; Thu, 17 Oct
 2019 17:13:11 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Sylvain Munaut <246tnt@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Spontaneous reboots when using RX 560
Thread-Topic: Spontaneous reboots when using RX 560
Thread-Index: AQHVhQ4nQfePts2grkK4xRAd+AGtiQ==
Date: Thu, 17 Oct 2019 17:13:11 +0000
Message-ID: <67658520-b3f4-d2f9-7247-dd434ab5c30b@amd.com>
References: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
 <CADnq5_N0r8O2vQapGaary0L-OfdTdz-ezcMJK90+Gy2sPujYcw@mail.gmail.com>
 <CAHL+j08qsu1pSOZPLB9-XWw9ZmT2OamaWPBJV4T3Vzx_C8cD7g@mail.gmail.com>
In-Reply-To: <CAHL+j08qsu1pSOZPLB9-XWw9ZmT2OamaWPBJV4T3Vzx_C8cD7g@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR0202CA0023.eurprd02.prod.outlook.com
 (2603:10a6:208:1::36) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cb291c1-6464-4c21-5b8b-08d75325497a
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2536:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB253686526FAC09A26724CA7D836D0@DM5PR12MB2536.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(199004)(189003)(7736002)(36756003)(8936002)(81166006)(8676002)(386003)(6506007)(86362001)(81156014)(31696002)(76176011)(52116002)(6436002)(6486002)(5660300002)(6246003)(6306002)(6512007)(6116002)(102836004)(99286004)(2906002)(305945005)(4326008)(66946007)(66476007)(66556008)(64756008)(66446008)(229853002)(486006)(31686004)(25786009)(256004)(14454004)(65806001)(65956001)(71200400001)(11346002)(316002)(71190400001)(110136005)(966005)(478600001)(46003)(186003)(476003)(446003)(58126008)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2536;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kEPP0rOxJUXBYklagv3Vx7MU4z/aTcZDfHWpXh1QXEhNPcUo666dJXqEXagj1JK9AydUcdRudjdsHghlTAZEhKRud0puM5Io9K0QlGm48syFo40n1nBZSBzQ+EXmv9C8Q9C8V6SU4VZ9l8vqbpblvr7iOSyOVC7s7nI02FKlHtJsSNJcWnX95vJGsG/pbT5E9ilj+m84LB05cXLX9aoU+E2TT1XtqxWf9eHHG+4xmlo5Dod1d1KPLUx+/gnivUNMIkV8Io7ps9OS8Q1rWCIVG/5uK5DJeHOgCA1R4CcMe4vn/aet1BtIbf2CWpKgohU1YiIp5teyfCi/XBAB4jkYKJiMmc+KA6pa9e5TMowh6DyDj7v4vEdYVbNAdKsyg6/Pheszyv73SvgFuTeySkS8P8i+iin/Fh1sRboFrg2Zkiuw3+hmKUrClwT70eNoXU9qKvPTsoaUWfMgyFvSpI4veQ==
x-ms-exchange-transport-forked: True
Content-ID: <4811F0F8B12B03428C425F136AB371F7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb291c1-6464-4c21-5b8b-08d75325497a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 17:13:11.0294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SGh3cEXjUwUGNmPs8wD734IzeMaqNtFyIx8IrRHdcoC2sheX+QMMZfXslyEHql6G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2536
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JhHQH6MmH/W8iJBZRZVDDCABSHL60BfNzeaO419vqc=;
 b=xJjwf6adP/Xaky9aXqwFONRvVyqAS66ryYLxqE7IPtzQIO4K3aNYQLemri8N6pHWGLzcNuciTzux3fbpiDM3/WvEVqUobr4OMJK2m5u3Zo6B/Ywd9FssoR9r0BO23s1nodTjUyvPl/SY2bNKKLZoJyvy4EhdMtVBVKKHi15Fk3c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTcuMTAuMTkgdW0gMTY6Mjkgc2NocmllYiBTeWx2YWluIE11bmF1dDoNCj4gSGksDQo+DQo+
DQo+Pj4gSSBoYXZlIFJYIDU2MCAyRyBjYXJkLiBJdCdzIHBsdWdnZWQgaW50byBhIDE2eCBwaHlz
aWNhbCAvIDR4DQo+Pj4gZWxlY3RyaWNhbCBzbG90IG9mIGEgWDU3MCBjaGlwc2V0IG1vdGhlcmJv
YXJkIHdpdGggYSBSeXplbiAzNzAwWCBDUFUuDQo+Pj4gVGhlIGhhcmR3YXJlIHdvcmtzIGZpbmUg
YW5kIGlzIHN0YWJsZSB1bmRlciBXaW5kb3dzICh0ZXN0ZWQgd2l0aA0KPj4+IGdhbWVzLCBiZW5j
aG1hcmtzLCBzdHJlc3MtdGVzdHMsIC4uLikNCj4+IERvZXMgYm9vdGluZyB3aXRoIHBjaT1ub2F0
cyBvbiB0aGUga2VybmVsIGNvbW1hbmQgbGluZSBpbiBncnViIGZpeCB0aGUgaXNzdWU/DQo+IEl0
IGRvZXNuJ3QgOi8NCj4NCj4gTWVzc2FnZSBpcyBzbGlnaHRseSBkaWZmZXJlbnQgYnV0IHNhbWUg
aWRlYSA6DQo+DQo+IFsgICA4My43MDQwMzVdIGFtZGdwdSAwMDAwOjA2OjAwLjA6IEFNRC1WaTog
RXZlbnQgbG9nZ2VkDQo+IFtJT19QQUdFX0ZBVUxUIGRvbWFpbj0weDAwMDAgYWRkcmVzcz0weDAg
ZmxhZ3M9MHgwMDIwXQ0KPiBbICAgODguNzMyNjg1XSBbZHJtOmFtZGdwdV9kbV9jb21taXRfcGxh
bmVzLmNvbnN0cHJvcC4wIFthbWRncHVdXQ0KPiAqRVJST1IqIFdhaXRpbmcgZm9yIGZlbmNlcyB0
aW1lZCBvdXQgb3IgaW50ZXJydXB0ZWQhDQo+IFsgICA5Mi4wNzQzNzldIGl4Z2JlIDAwMDA6MDQ6
MDAuMTogQWRhcHRlciByZW1vdmVkDQo+IFsgICA5My40ODA5ODldIGlnYiAwMDAwOjA3OjAwLjAg
ZW5wN3MwOiBQQ0llIGxpbmsgbG9zdA0KPg0KPiBTbyBpdCBzY3Jld3MgdXAgdGhlIFBDSWUgdmVy
eSBiYWRseSA6Lw0KPiBTcGVjaWZpY2FsbHkgc2VlbXMgdG8gYmUgZXZlcnl0aGluZyBjb25uZWN0
ZWQgdG8gdGhlIFg1NzAgY2hpcHNldC4NCg0KIEZyb20gdGhlIGhhcmR3YXJlIHBvaW50IG9mIHZp
ZXcgdGhlIG9ubHkgdGhpbmcgd2hpY2ggY29tZXMgdG8gbWluZCBpcyANCnRoYXQgeW91IHNvbWVo
b3cgdHJpZ2dlcmVkIHRoZSBFU0QgcHJvdGVjdGlvbi4NCg0KSSBhc3N1bWUgeW91IGNhbiBydWxl
IG91dCBhbiB1bnN0YWJsZSBwaHlzaWNhbCBjb25uZWN0aW9uIChiZWNhdXNlIGl0IA0Kd29ya3Mg
b24gd2luZG93cyksIHNvIHRoZSBvbmx5IHRoaW5nIGxlZnQgaXMgdGhhdCB0aGVyZSBpcyBzb21l
dGhpbmcgDQp2ZXJ5IHZlcnkgYmFkbHkgZ29pbmcgd3Jvbmcgd2l0aCBwb3dlciBtYW5hZ2VtZW50
Lg0KDQpIYXZlIHlvdSAidHVuZWQiIHRoZSBwb3dlciB0YWJsZXMgb24gdGhlIGJvYXJkIHNvbWVo
b3c/IE9yIG1heWJlIA0KbXVsdGlwbGUgR1BVcyBjb25uZWN0ZWQgdG8gdGhlIHNhbWUgcG93ZXIg
c3VwcGx5Pw0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IENoZWVycywNCj4NCj4gICAg
ICBTeWx2YWluDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
