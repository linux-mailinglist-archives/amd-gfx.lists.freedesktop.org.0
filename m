Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F855D6FE3
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 09:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8807D6E5F9;
	Tue, 15 Oct 2019 07:08:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780047.outbound.protection.outlook.com [40.107.78.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F30B6E5F9
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 07:08:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1wHQ+sEFUAO55e8BokJXDw1/fCl+00++0CCOafmoExoAnETPUg0milLEnTdNoAVdd7QAl804o8tdRY8ci0tp3H9BciOZskfqTfo1k/DspViTgRATsSuF1mCj77r/cBsFYoHW7fChAMxEotRdoXuLXpvDtgsnlZnKD43mvWWPAWbIGEc5U6X976xlEh9GN9cPExr1nglVeNtdJGIALRrsJV6rCkFV98hPyW7a+4w4hbsBIryyC87d+h+wq5kwvdt64RFWI+IdTDE+jkKwm14MbgL/dY1gVN/ZTNEOsQRg+w6kWUsyGV91aYqEKQRl03jog1uoqXTzREC9fxXOb1l4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzX8nntndpVFVXhux9JrI6FqueVu0QtbhToSul5Y5GA=;
 b=dk/7+7ecYr0TS2bsb85rLWnT62eljyvDY7ZpcOEp/pzPObhN4taSuQG26wiZPBUwMdTbF0fO3FNONckkH5RvrhaHmPmYkoznJ3wsy76cQ2mf03cchpQEvpzIcDFHcZ2kUtQCAUhW3kVRcLVB4ggeZDFfYTy2gzbgMe+ssEva/kH9XRH3QbkJ+SD4XREDCBgP6iis9zGesWBzCvQIzGzXrBWUcMU0TOiXq3LnpI6UyLgzupvGvZmKN0IohDJ9Lce5Ba0MkImQcmOf6t6mY3u2FWjfNomNBnd2wE7xf7o2w2wgY7J+lhbs6x+Ch3jiS1h3U1jhAX52SKVLEG8Je667YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB4254.namprd12.prod.outlook.com (10.255.224.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Tue, 15 Oct 2019 07:08:19 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::dd77:dfe4:1913:9d7e]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::dd77:dfe4:1913:9d7e%4]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 07:08:19 +0000
From: "S, Shirish" <sshankar@amd.com>
To: Nick Desaulniers <ndesaulniers@google.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: AMDGPU and 16B stack alignment
Thread-Topic: AMDGPU and 16B stack alignment
Thread-Index: AQHVgt3apwMg5pas7kOX+VanLgXpgqdbSgsA
Date: Tue, 15 Oct 2019 07:08:19 +0000
Message-ID: <9e4d6378-5032-8521-13a9-d9d9519d07de@amd.com>
References: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
In-Reply-To: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0094.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::34)
 To MN2PR12MB3248.namprd12.prod.outlook.com
 (2603:10b6:208:a9::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.157.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01614867-cf8a-4c97-9405-08d7513e74bc
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4254:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4254A4B7B95E47CBD266D6A4F2930@MN2PR12MB4254.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(189003)(199004)(2616005)(66066001)(6636002)(66556008)(66476007)(64756008)(66946007)(11346002)(66446008)(71200400001)(71190400001)(31686004)(81166006)(8676002)(8936002)(81156014)(476003)(186003)(102836004)(486006)(26005)(2906002)(446003)(7736002)(110136005)(99286004)(54906003)(5660300002)(316002)(6506007)(36756003)(76176011)(256004)(3846002)(31696002)(53546011)(386003)(52116002)(6116002)(6486002)(229853002)(606006)(25786009)(6512007)(54896002)(6306002)(236005)(4326008)(6436002)(6246003)(966005)(14454004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4254;
 H:MN2PR12MB3248.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1IFkOUblArKgJzzr47qz+j+rHvHIF/oSIP4OoLqs9SGKKUcJMmdqDcFM/dJn3vMbtAQteWO54T/Hvduz0LyaEvY2saY0Y9rPi4lFjFsv+Z3quzFTu85jvI5KRR0hVTzxz0y1Z0s1fMNVx8Z6d8c/YU+e90jUfZ9iTYznt0qGvD23vMRIbwMl9VFRirnXWAiXgczaiC7iKSXATYzbg4WKKBFd2LXtsrCi1OZsIMKjY6vOYNoTZJuFd3BrQpVkeUDnd0K6r5uIwIuwxNm6+Y/xiIQ1MJt/nkit+fKIUgM8jVa2XonFdpWzkaJBQAA6Y8gkdILcCwCK3MYRJyGKRgHmC761F8Vzycbl5wVFqydOc5ZwUHD//GynwWqpAKHWiHbd9AHRERG0YFG67xbx5Lgov21fwOf3n412fHEHUm9Nej28v4zmgG2L6qG4PBC5dI/QpW26yh7U7M0Zb66Vw/gsrw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01614867-cf8a-4c97-9405-08d7513e74bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 07:08:19.1578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcEKODsyV8Z8jG5NmIRrohtrDBKrVLlgTBlujwOHmalwUfuZAJ/KZPPb9877umfbzIRqq0MpFKy4S8OuPfmjSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzX8nntndpVFVXhux9JrI6FqueVu0QtbhToSul5Y5GA=;
 b=amATFtbqWEmJqzDJHeRU1HN0dWeFNh5PRB3xt2BehamnXv3Wy/PoTFLf9516rcbMfxCUVLfUFDLHaeTKU5cQyaVPbCA/v2s/8slXacZivv8el0RAzVDqpWTTkY4W8UZs1vDTEtRP30PI3EBGW6ABsO9iYJDxVDvCR2qmk8esPyU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shirish.S@amd.com; 
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "S, 
 Shirish" <Shirish.S@amd.com>, Matthias Kaehlcke <mka@google.com>,
 "yshuiv7@gmail.com" <yshuiv7@gmail.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1893495904=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1893495904==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9e4d63785032852113a9d9d9519d07deamdcom_"

--_000_9e4d63785032852113a9d9d9519d07deamdcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTmljaywNCg0KT24gMTAvMTUvMjAxOSAzOjUyIEFNLCBOaWNrIERlc2F1bG5pZXJzIHdyb3Rl
Og0KDQpIZWxsbyENCg0KVGhlIHg4NiBrZXJuZWwgaXMgY29tcGlsZWQgd2l0aCBhbiA4QiBzdGFj
ayBhbGlnbm1lbnQgdmlhDQogICAgYC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTNgIGZvciBH
Q0Mgc2luY2UgMy42LXJjMSB2aWENCiAgICBjb21taXQgZDliMGNkZTkxYzYwICgieDg2LTY0LCBn
Y2M6IFVzZQ0KLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9MyBpZiBzdXBwb3J0ZWQiKQ0KICAg
IG9yIGAtbXN0YWNrLWFsaWdubWVudD04YCBmb3IgQ2xhbmcuIFBhcnRzIG9mIHRoZSBBTURHUFUg
ZHJpdmVyIGFyZQ0KICAgIGNvbXBpbGVkIHdpdGggMTZCIHN0YWNrIGFsaWdubWVudC4NCg0KICAg
IEdlbmVyYWxseSwgdGhlIHN0YWNrIGFsaWdubWVudCBpcyBwYXJ0IG9mIHRoZSBBQkkuIExpbmtp
bmcgdG9nZXRoZXIgdHdvDQogICAgZGlmZmVyZW50IHRyYW5zbGF0aW9uIHVuaXRzIHdpdGggZGlm
ZmVyaW5nIHN0YWNrIGFsaWdubWVudCBpcyBkYW5nZXJvdXMsDQogICAgcGFydGljdWxhcmx5IHdo
ZW4gdGhlIHRyYW5zbGF0aW9uIHVuaXQgd2l0aCB0aGUgc21hbGxlciBzdGFjayBhbGlnbm1lbnQN
CiAgICBtYWtlcyBjYWxscyBpbnRvIHRoZSB0cmFuc2xhdGlvbiB1bml0IHdpdGggdGhlIGxhcmdl
ciBzdGFjayBhbGlnbm1lbnQuDQogICAgV2hpbGUgOEIgYWxpZ25lZCBzdGFja3MgYXJlIHNvbWV0
aW1lcyBhbHNvIDE2QiBhbGlnbmVkLCB0aGV5IGFyZSBub3QNCiAgICBhbHdheXMuDQoNCiAgICBN
dWx0aXBsZSB1c2VycyBoYXZlIHJlcG9ydGVkIEdlbmVyYWwgUHJvdGVjdGlvbiBGYXVsdHMgKEdQ
Rikgd2hlbiB1c2luZw0KICAgIHRoZSBBTURHUFUgZHJpdmVyIGNvbXBpbGVkIHdpdGggQ2xhbmcu
IENsYW5nIGlzIHBsYWNpbmcgb2JqZWN0cyBpbiBzdGFjaw0KICAgIHNsb3RzIGFzc3VtaW5nIHRo
ZSBzdGFjayBpcyAxNkIgYWxpZ25lZCwgYW5kIHNlbGVjdGluZyBpbnN0cnVjdGlvbnMgdGhhdA0K
ICAgIHJlcXVpcmUgMTZCIGFsaWduZWQgbWVtb3J5IG9wZXJhbmRzLiBBdCBydW50aW1lLCBzeXNj
YWxscyBoYW5kbGluZyA4Qg0KICAgIHN0YWNrIGFsaWduZWQgY29kZSBjYWxscyBpbnRvIGNvZGUg
dGhhdCBhc3N1bWVzIDE2QiBzdGFjayBhbGlnbm1lbnQuDQogICAgV2hlbiB0aGUgc3RhY2sgaXMg
YSBtdWx0aXBsZSBvZiA4QiBidXQgbm90IDE2QiwgdGhlc2UgaW5zdHJ1Y3Rpb25zDQogICAgcmVz
dWx0IGluIGEgR1BGLg0KDQogICAgR0NDIGRvZXNuJ3Qgc2VsZWN0IGluc3RydWN0aW9ucyB3aXRo
IGFsaWdubWVudCByZXF1aXJlbWVudHMsIHNvIHRoZSBHUEZzDQogICAgYXJlbid0IG9ic2VydmVk
LCBidXQgaXQgaXMgc3RpbGwgY29uc2lkZXJlZCBhbiBBQkkgYnJlYWthZ2UgdG8gbWl4IGFuZA0K
ICAgIG1hdGNoIHN0YWNrIGFsaWdubWVudC4NCg0KSSBoYXZlIHBhdGNoZXMgdGhhdCBiYXNpY2Fs
bHkgcmVtb3ZlIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTQgYW5kDQotbXN0YWNrLWFsaWdu
bWVudD0xNiBmcm9tIEFNREdQVToNCmh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgv
bGludXgvaXNzdWVzLzczNSNpc3N1ZWNvbW1lbnQtNTQxMjQ3NjAxDQpZdXh1YW4gaGFzIHRlc3Rl
ZCB3aXRoIENsYW5nIGFuZCBHQ0MgYW5kIHJlcG9ydGVkIGl0IGZpeGVzIHRoZSBHUEYncyBvYnNl
cnZlZC4NCg0KTXkgZ2NjIGJ1aWxkIGZhaWxzIHdpdGggYmVsb3cgZXJyb3JzOg0KDQpkY25fY2Fs
Y3MuYzoxOjA6IGVycm9yOiAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT0zIGlzIG5vdCBiZXR3
ZWVuIDQgYW5kIDEyDQoNCmRjbl9jYWxjX21hdGguYzoxOjA6IGVycm9yOiAtbXByZWZlcnJlZC1z
dGFjay1ib3VuZGFyeT0zIGlzIG5vdCBiZXR3ZWVuIDQgYW5kIDEyDQoNCldoaWxlIEdQRiBvYnNl
cnZlZCBvbiBjbGFuZyBidWlsZHMgc2VlbSB0byBiZSBmaXhlZC4NCg0KLS0NClJlZ2FyZHMsDQpT
aGlyaXNoIFMNCg0KDQoNCkkndmUgc3BsaXQgdGhlIHBhdGNoIGludG8gNDsgc2FtZSBjb21taXQg
bWVzc2FnZSBidXQgZGlmZmVyZW50IEZpeGVzDQp0YWdzIHNvIHRoYXQgdGhleSBiYWNrcG9ydCB0
byBzdGFibGUgb24gZmluZXIgZ3JhbnVsYXJpdHkuIDIgcXVlc3Rpb25zDQpCRUZPUkUgSSBzZW5k
IHRoZSBzZXJpZXM6DQoNCjEuIFdvdWxkIHlvdSBwcmVmZXIgNCBwYXRjaGVzIHdpdGggdW5pcXVl
IGBmaXhlc2AgdGFncywgb3IgMSBwYXRjaD8NCjIuIFdhcyB0aGVyZSBvciBpcyB0aGVyZSBzdGls
bCBhIGdvb2QgcmVhc29uIGZvciB0aGUgc3RhY2sgYWxpZ25tZW50IG1pc21hdGNoPw0KDQooRnVy
dGhlciwgSSB0aGluayB3ZSBjYW4gdXNlIC1tc3NlMiBmb3IgQk9USCBjbGFuZytnY2MgYWZ0ZXIg
bXkgcGF0Y2gsDQpidXQgSSBkb24ndCBoYXZlIGhhcmR3YXJlIHRvIHRlc3Qgb24uIEknbSBoYXBw
eSB0byB3cml0ZS9zZW5kIHRoZQ0KZm9sbG93IHVwIHBhdGNoLCBidXQgSSdkIG5lZWQgaGVscCB0
ZXN0aW5nKS4NCg0KDQoNCg0K

--_000_9e4d63785032852113a9d9d9519d07deamdcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <267B82E01838E646AB58A6CF276F443F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KPHA+SGkgTmljayw8YnI+DQo8L3A+DQo8ZGl2IGNsYXNzPSJt
b3otY2l0ZS1wcmVmaXgiPk9uIDEwLzE1LzIwMTkgMzo1MiBBTSwgTmljayBEZXNhdWxuaWVycyB3
cm90ZTo8YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpDQUt3
dk9kbkRWZS1kYWhaR25SdHpNcngtQUhfQyYjNDM7MkxmMjBxakZRSE50bjl4aD1Pa3p3QG1haWwu
Z21haWwuY29tIj4NCjxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+SGVsbG8hDQoN
ClRoZSB4ODYga2VybmVsIGlzIGNvbXBpbGVkIHdpdGggYW4gOEIgc3RhY2sgYWxpZ25tZW50IHZp
YQ0KICAgIGAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT0zYCBmb3IgR0NDIHNpbmNlIDMuNi1y
YzEgdmlhDQogICAgY29tbWl0IGQ5YjBjZGU5MWM2MCAoJnF1b3Q7eDg2LTY0LCBnY2M6IFVzZQ0K
LW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9MyBpZiBzdXBwb3J0ZWQmcXVvdDspDQogICAgb3Ig
YC1tc3RhY2stYWxpZ25tZW50PThgIGZvciBDbGFuZy4gUGFydHMgb2YgdGhlIEFNREdQVSBkcml2
ZXIgYXJlDQogICAgY29tcGlsZWQgd2l0aCAxNkIgc3RhY2sgYWxpZ25tZW50Lg0KDQogICAgR2Vu
ZXJhbGx5LCB0aGUgc3RhY2sgYWxpZ25tZW50IGlzIHBhcnQgb2YgdGhlIEFCSS4gTGlua2luZyB0
b2dldGhlciB0d28NCiAgICBkaWZmZXJlbnQgdHJhbnNsYXRpb24gdW5pdHMgd2l0aCBkaWZmZXJp
bmcgc3RhY2sgYWxpZ25tZW50IGlzIGRhbmdlcm91cywNCiAgICBwYXJ0aWN1bGFybHkgd2hlbiB0
aGUgdHJhbnNsYXRpb24gdW5pdCB3aXRoIHRoZSBzbWFsbGVyIHN0YWNrIGFsaWdubWVudA0KICAg
IG1ha2VzIGNhbGxzIGludG8gdGhlIHRyYW5zbGF0aW9uIHVuaXQgd2l0aCB0aGUgbGFyZ2VyIHN0
YWNrIGFsaWdubWVudC4NCiAgICBXaGlsZSA4QiBhbGlnbmVkIHN0YWNrcyBhcmUgc29tZXRpbWVz
IGFsc28gMTZCIGFsaWduZWQsIHRoZXkgYXJlIG5vdA0KICAgIGFsd2F5cy4NCg0KICAgIE11bHRp
cGxlIHVzZXJzIGhhdmUgcmVwb3J0ZWQgR2VuZXJhbCBQcm90ZWN0aW9uIEZhdWx0cyAoR1BGKSB3
aGVuIHVzaW5nDQogICAgdGhlIEFNREdQVSBkcml2ZXIgY29tcGlsZWQgd2l0aCBDbGFuZy4gQ2xh
bmcgaXMgcGxhY2luZyBvYmplY3RzIGluIHN0YWNrDQogICAgc2xvdHMgYXNzdW1pbmcgdGhlIHN0
YWNrIGlzIDE2QiBhbGlnbmVkLCBhbmQgc2VsZWN0aW5nIGluc3RydWN0aW9ucyB0aGF0DQogICAg
cmVxdWlyZSAxNkIgYWxpZ25lZCBtZW1vcnkgb3BlcmFuZHMuIEF0IHJ1bnRpbWUsIHN5c2NhbGxz
IGhhbmRsaW5nIDhCDQogICAgc3RhY2sgYWxpZ25lZCBjb2RlIGNhbGxzIGludG8gY29kZSB0aGF0
IGFzc3VtZXMgMTZCIHN0YWNrIGFsaWdubWVudC4NCiAgICBXaGVuIHRoZSBzdGFjayBpcyBhIG11
bHRpcGxlIG9mIDhCIGJ1dCBub3QgMTZCLCB0aGVzZSBpbnN0cnVjdGlvbnMNCiAgICByZXN1bHQg
aW4gYSBHUEYuDQoNCiAgICBHQ0MgZG9lc24ndCBzZWxlY3QgaW5zdHJ1Y3Rpb25zIHdpdGggYWxp
Z25tZW50IHJlcXVpcmVtZW50cywgc28gdGhlIEdQRnMNCiAgICBhcmVuJ3Qgb2JzZXJ2ZWQsIGJ1
dCBpdCBpcyBzdGlsbCBjb25zaWRlcmVkIGFuIEFCSSBicmVha2FnZSB0byBtaXggYW5kDQogICAg
bWF0Y2ggc3RhY2sgYWxpZ25tZW50Lg0KDQpJIGhhdmUgcGF0Y2hlcyB0aGF0IGJhc2ljYWxseSBy
ZW1vdmUgLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9NCBhbmQNCi1tc3RhY2stYWxpZ25tZW50
PTE2IGZyb20gQU1ER1BVOg0KPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0i
aHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvNzM1I2lzc3Vl
Y29tbWVudC01NDEyNDc2MDEiPmh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGlu
dXgvaXNzdWVzLzczNSNpc3N1ZWNvbW1lbnQtNTQxMjQ3NjAxPC9hPg0KWXV4dWFuIGhhcyB0ZXN0
ZWQgd2l0aCBDbGFuZyBhbmQgR0NDIGFuZCByZXBvcnRlZCBpdCBmaXhlcyB0aGUgR1BGJ3Mgb2Jz
ZXJ2ZWQuPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cD5NeSBnY2MgYnVpbGQgZmFpbHMgd2l0aCBi
ZWxvdyBlcnJvcnM6PC9wPg0KPGJsb2NrcXVvdGU+DQo8cD5kY25fY2FsY3MuYzoxOjA6IGVycm9y
OiAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT0zIGlzIG5vdCBiZXR3ZWVuIDQgYW5kIDEyPC9w
Pg0KPHA+ZGNuX2NhbGNfbWF0aC5jOjE6MDogZXJyb3I6IC1tcHJlZmVycmVkLXN0YWNrLWJvdW5k
YXJ5PTMgaXMgbm90IGJldHdlZW4gNCBhbmQgMTI8L3A+DQo8L2Jsb2NrcXVvdGU+DQo8cD5XaGls
ZSBHUEYgb2JzZXJ2ZWQgb24gY2xhbmcgYnVpbGRzIHNlZW0gdG8gYmUgZml4ZWQuPGJyPg0KPC9w
Pg0KPHByZSBjbGFzcz0ibW96LXNpZ25hdHVyZSIgY29scz0iNzIiPi0tIA0KUmVnYXJkcywNClNo
aXJpc2ggUzwvcHJlPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOkNBS3d2T2Ru
RFZlLWRhaFpHblJ0ek1yeC1BSF9DJiM0MzsyTGYyMHFqRlFITnRuOXhoPU9rendAbWFpbC5nbWFp
bC5jb20iPg0KPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4NCg0KSSd2ZSBzcGxp
dCB0aGUgcGF0Y2ggaW50byA0OyBzYW1lIGNvbW1pdCBtZXNzYWdlIGJ1dCBkaWZmZXJlbnQgRml4
ZXMNCnRhZ3Mgc28gdGhhdCB0aGV5IGJhY2twb3J0IHRvIHN0YWJsZSBvbiBmaW5lciBncmFudWxh
cml0eS4gMiBxdWVzdGlvbnMNCkJFRk9SRSBJIHNlbmQgdGhlIHNlcmllczoNCg0KMS4gV291bGQg
eW91IHByZWZlciA0IHBhdGNoZXMgd2l0aCB1bmlxdWUgYGZpeGVzYCB0YWdzLCBvciAxIHBhdGNo
Pw0KMi4gV2FzIHRoZXJlIG9yIGlzIHRoZXJlIHN0aWxsIGEgZ29vZCByZWFzb24gZm9yIHRoZSBz
dGFjayBhbGlnbm1lbnQgbWlzbWF0Y2g/DQoNCihGdXJ0aGVyLCBJIHRoaW5rIHdlIGNhbiB1c2Ug
LW1zc2UyIGZvciBCT1RIIGNsYW5nJiM0MztnY2MgYWZ0ZXIgbXkgcGF0Y2gsDQpidXQgSSBkb24n
dCBoYXZlIGhhcmR3YXJlIHRvIHRlc3Qgb24uIEknbSBoYXBweSB0byB3cml0ZS9zZW5kIHRoZQ0K
Zm9sbG93IHVwIHBhdGNoLCBidXQgSSdkIG5lZWQgaGVscCB0ZXN0aW5nKS4NCjwvcHJlPg0KPC9i
bG9ja3F1b3RlPg0KPHByZSBjbGFzcz0ibW96LXNpZ25hdHVyZSIgY29scz0iNzIiPg0KPC9wcmU+
DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_9e4d63785032852113a9d9d9519d07deamdcom_--

--===============1893495904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1893495904==--
