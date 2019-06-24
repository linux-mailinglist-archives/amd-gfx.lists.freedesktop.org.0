Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE0E50CA1
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 15:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D1E89B46;
	Mon, 24 Jun 2019 13:53:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD6489B42
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 13:53:02 +0000 (UTC)
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1850.namprd12.prod.outlook.com (10.175.86.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 13:53:00 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa%9]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 13:53:00 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, =?utf-8?B?RGlldGVyIE7DvHR6ZWw=?=
 <Dieter@nuetzel-hh.de>, Alex Deucher <alexdeucher@gmail.com>
Subject: RE: [amd-staging-drm-next] broken after Navi merge
Thread-Topic: [amd-staging-drm-next] broken after Navi merge
Thread-Index: AQHVKpDN9tJBq/25KEO5iZRD1Vrrsqaq0bMwgAAAx4A=
Date: Mon, 24 Jun 2019 13:53:00 +0000
Message-ID: <DM5PR12MB141886EE5B99F13C6AFA16EBFCE00@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <9ec82cfce8a6ee8f24e085e1a423ecaf@nuetzel-hh.de>
 <DM5PR12MB1418BDB2340B377498F22901FCE00@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB1418BDB2340B377498F22901FCE00@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cef62559-97e8-45f8-851c-08d6f8ab4584
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1850; 
x-ms-traffictypediagnostic: DM5PR12MB1850:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR12MB18508E6438BF3671DEFBD3BFFCE00@DM5PR12MB1850.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(396003)(39860400002)(376002)(13464003)(199004)(189003)(53936002)(33656002)(486006)(66946007)(66476007)(66556008)(76116006)(73956011)(102836004)(71190400001)(71200400001)(110136005)(8936002)(316002)(186003)(55016002)(6436002)(229853002)(7736002)(76176011)(7696005)(53546011)(68736007)(6506007)(74316002)(6306002)(99286004)(9686003)(305945005)(25786009)(2940100002)(476003)(11346002)(66066001)(66446008)(4326008)(26005)(14444005)(256004)(52536014)(446003)(8676002)(6116002)(3846002)(81166006)(64756008)(66574012)(81156014)(966005)(6246003)(478600001)(72206003)(14454004)(86362001)(5660300002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1850;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5ThyvuJ7VvcKc5joke5y/rpA9aUQaOOasXHujCr3mIeEpDRvvXlx8Qv3K4S6yTU680qaUeP/sorK+OseBRMJ14xPfBxszyWDsMXxUzhMt5vIJdLecuZFMHbp/gWpF/3yRD+4lHLVDH/NBIZPRWQ1g75aUH9979PKpzxlw1WKgmF3W4PIHrE+Zas/oIuXVoLoqqm0pwQJ0GJD6oKNETNlERjBCH+ZBIx3Qg/mI47sAxqCIEP11u6sGMlImDPM4UQWzYm3w+eKN5Hd1YxSREPlgUKYWkW+7Q8ir7nPnT2/y1Wl+MeVi9p/xP6GnXEw97PgXXGX6k6kdDrYCNxYiH+NT3umqnc/zPsKYYQ27QaK2Y3wQy7EVyjvRGzAyTXxs26z5Ld0s7nZsZx8QcKz6lUJjotZN4ytsrgoVICdnLN6mg0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef62559-97e8-45f8-851c-08d6f8ab4584
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 13:53:00.8442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1850
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSu9zZIPSIL7xaeENX85vmc4HU8ncEVaVk5MLjRJN2U=;
 b=oIvZGydge9WMo7Lzvkd/a+BP/bJDohmZjZA1Wf9v6SYJDImLdzoenDMMjVuEeEj1MNY5yfLEUGZDgb/CPI8g9hiy+POKIRPxR/RvRcIO33LAMvA3S84R7sc+vqXW9zM8QH4xMkX57LUPeI9smatrg7aUz+OBBWcVJOpun24EcgM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: amd-devel <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWgsIHNvcnJ5LCBpdCBoYXMgbm90IGxhbmRlZCB5ZXQuIGJ1dCB0aGUgcGF0Y2ggaXMgaW4gcmV2
aWV3IGxpc3Qgbm93Lg0KW1BBVENIXSBkcm0vYW1kZ3B1OiBmaXggbW9kcHJvYmUgZmFpbHVyZSBm
b3IgdXZkXzQvNS82DQoNClJlZ2FyZHMsDQpIYXdraW5nDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz4gT24gQmVoYWxmIE9mIFpoYW5nLCBIYXdraW5nDQpTZW50OiAyMDE55bm0NuaciDI05pelIDIx
OjUwDQpUbzogRGlldGVyIE7DvHR6ZWwgPERpZXRlckBudWV0emVsLWhoLmRlPjsgQWxleCBEZXVj
aGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQpDYzogYW1kLWRldmVsIDxhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4NClN1YmplY3Q6IFJFOiBbYW1kLXN0YWdpbmctZHJtLW5leHRdIGJy
b2tlbiBhZnRlciBOYXZpIG1lcmdlDQoNClBsZWFzZSBwdWxsIG15IGxhdGVzdCBmaXhlcyB0aGF0
IHByb2JhYmx5IGhlbHBzIG9uIGlzc3VlIHlvdSByYW4gaW50by4NCjYxYWRkYTFmNmYwODA3MTdh
OWVlNGM5NmE3NGM4ZGY2ZmZhYjFmZjAgZHJtL2FtZGdwdTogZml4IG1vZHByb2JlIGZhaWx1cmUg
Zm9yIHV2ZF80LzUvNg0KDQpSZWdhcmRzLA0KSGF3a2luZw0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5v
cmc+IE9uIEJlaGFsZiBPZiBEaWV0ZXIgTsO8dHplbA0KU2VudDogMjAxOeW5tDbmnIgyNOaXpSAy
MToyOQ0KVG86IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPg0KQ2M6IGFtZC1k
ZXZlbCA8YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQpTdWJqZWN0OiBbYW1kLXN0YWdp
bmctZHJtLW5leHRdIGJyb2tlbiBhZnRlciBOYXZpIG1lcmdlDQoNCkhlbGxvIEFsZXgsDQoNCmFm
dGVyIHlvdXIgbGF0ZXN0IE5hdmkgbWVyZ2UgJ2FtZC1zdGFnaW5nLWRybS1uZXh0JyBpcyBicm9r
ZW4gd2l0aCBQb2xhcmlzIDIwLg0KDQpJdCBoYW5ncyB3aXRoIHZlcnkgbGlnaHQgZ3JheSAobW9z
dGx5IGJsYWNrKSBzY3JlZW4gYWZ0ZXIgZmlyc3QgbW9kZSBzd2l0Y2guDQoNClRlc3RlZCBjb21t
aXQ6DQozMTdkNTAzM2FiNmMgKEhFQUQgLT4gYW1kLXN0YWdpbmctZHJtLW5leHQsIG9yaWdpbi9h
bWQtc3RhZ2luZy1kcm0tbmV4dCkNCmRybS9hbWRncHU6IGFkZCBqb2ItPnByZWFtYmxlX3N0YXR1
cyBiYWNrIHRvIHN0YXR1cyB2YWx1ZQ0KDQpFdmVuIHJ1biBtb2RlIDN8MSB3aXRoIGdydWIyIGRv
IG5vdCB3b3Jrcy4NCg0KU2VlIGFsc286DQpodHRwczovL3d3dy5waG9yb25peC5jb20vZm9ydW1z
L2ZvcnVtL3Bob3Jvbml4L2xhdGVzdC1waG9yb25peC1hcnRpY2xlcy8xMTA4NTAwLWFtZC1zZW5k
cy1pbi1uYXZpLXN1cHBvcnQtb3RoZXItcmVtYWluaW5nLWFtZGdwdS1jaGFuZ2VzLWZvci1saW51
eC01LTM/cD0xMTA4Njg2I3Bvc3QxMTA4Njg2DQoNCkkgaGF2ZSB0byByb2xsIGJhY2sgYmVmb3Jl
IE5hdmkgY29tbWl0cyB0byBnZXQgd29ya2luZyAnYW1kLXN0YWdpbmctZHJtLW5leHQnIGtlcm5l
bCwgYWdhaW4uDQoNCk1heWJlIHlvdSBoYXZlIHNvbWUgJ3NwYXJlJyB0aW1lIGRlc3BpdGUgYWxs
IHlvdXIgTmF2aSBlbmFibGVtZW50IHdvcmsgdG8gbGlmdCAnYW1kLXN0YWdpbmctZHJtLW5leHQn
IHRvIGF0IGxlYXN0IDUuMi1yYzYgKHRoZSBTdGVhbSBUQ1AgdGhpbmcpLg0KDQpHcmVldGluZ3Ms
DQpEaWV0ZXINCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFp
bGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
