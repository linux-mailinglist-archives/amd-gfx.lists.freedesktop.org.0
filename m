Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3766BA96D0
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 01:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7ACD892E7;
	Wed,  4 Sep 2019 23:03:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770087.outbound.protection.outlook.com [40.107.77.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D401A892E7
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 23:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BITvosb18yRlzduuoxLlvrEevdcd9mch4Lw734nqDrkH+NeRt+V8eb+kK5e9BKN1uiTiQR7ahTnPyCDZN5lmSjXNd/JKcHfyjh4KOdDAO8YQ7PXlMSVtuwK1/w7fvCA/EmMIrY2tjpbRfTlFe8W+VPUcf+0EqzDt55rchpSHZiufUdFZUNDZ2RMe1jaGjjpCDvouKGkDAWMY1bGe5X3DVfkSKGQ/YkkpmqO6YXg1jYgevmgQKynZzEoPeoVjXyQjJkWjy35wUGDcQKdWbgZslVKbsiu8P6ULzEEPfYuD0+Niit4n/xedehFthIwP8ZLYcvSK20lPrNwQT7oEZdo9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GS4yoBeHtoIbt68cvur/Lr6lA7QWbKYmuo6obLBWSOE=;
 b=J1EmxEmf7eHTkL9IWmoP2EyO99VFCV+HBb6+D9FUdTexs/mYJ1o0uJKAqLHvLNOqnRlWc0zW/rVQg0P4nbboOXAeKTrs3KQlu6Vp1U2O+mNibhA5SeXmt48lj/spdEXf5G7B5p8fsFRnibgchDdI1QfflTxP1h1pMkWdBwZzEtA+yA/AJHcH/WG6+sOsjeyQu5mFev61+M9VPw/3u/Gi3G2Sjbg28iuwDySnlblPK3qWwaf1wFw3k3Y4BPKAglJWwpQG7i0I4q1eqBrYgl4jOYLNZnyJ5u/xEgzfdbnJyvDcVQOxpgrBStcnj7Cy0060OSbtZFZC9HN8Qx1Nd0ULhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3407.namprd12.prod.outlook.com (20.178.241.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 23:03:28 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 23:03:28 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Graceful page fault handling for Vega/Navi
Thread-Topic: Graceful page fault handling for Vega/Navi
Thread-Index: AQHVYzHO6HiF4NHRoUuUgm7OHD4xM6ccqWiA
Date: Wed, 4 Sep 2019 23:03:28 +0000
Message-ID: <MN2PR12MB3309C53565E6D4E2E9FE23C7ECB80@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
In-Reply-To: <20190904150230.13885-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MN2PR12MB3309.namprd12.prod.outlook.com
 (15.20.2220.007)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c1facb1-9b2d-422a-2d8a-08d7318c1932
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3407; 
x-ms-traffictypediagnostic: MN2PR12MB3407:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3407E7FBFEEB61452F8983ADECB80@MN2PR12MB3407.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(53754006)(199004)(189003)(71200400001)(71190400001)(316002)(6246003)(99286004)(7696005)(25786009)(4326008)(14444005)(256004)(26005)(6306002)(76176011)(6506007)(66066001)(102836004)(186003)(53936002)(11346002)(33656002)(486006)(476003)(446003)(55016002)(6436002)(66574012)(7736002)(66476007)(9686003)(66556008)(64756008)(66446008)(74316002)(14454004)(52536014)(66946007)(3846002)(6116002)(76116006)(478600001)(81166006)(81156014)(8936002)(2906002)(86362001)(6916009)(966005)(229853002)(8676002)(305945005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3407;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /qLNef9UDXdHHIqJAzrIik5rtWyoYrvBqhrZckR5Mjtzcqcv+QTXcDyMSwwNQK7pLAPxfSuDfhqUrwoJ7hJa1nvA6XB5GNXRMSXx8u2Sge+p80dwULEa4/GAS/1lVC0Qbk8NcyUiIYcUQWjE8b93RYeqCVgLXh+7faf8oKiRJYalv9TmPhSBn1bn3y7jLPT5qN5gMCgf8OPOW8dwAEjG5/jMuW+Y6wh3ebmpCoL3rZbfC5oN4eKnNRJEj8LMp2LaNDjpvwx+uWmLdVeZl9t+yqyNrY3DIMlhL8E5yf8ZdSTheqDXww9M5Hke2mnN/bBxefvElcLFh7qXRHh6R3hHkxnvSx1hP83/9GaJU1GYXa2mQxpmcmiLVH78ugTsSpubhAVEL0LnF/nIKWVNxcqM1OS890JIZDPXfZ8X94biMD8=
x-ms-exchange-transport-forked: True
Content-ID: <F1666A3D79067D41A2421676C2787F68@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1facb1-9b2d-422a-2d8a-08d7318c1932
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 23:03:28.2027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A8BIHWPYlT+Sd5Tm25nqqQA7t6IGFkzUakxKTUYH68/MZiz+76isA9EGhbpX62I53KIas77MMbeJvUtnRBLXKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3407
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GS4yoBeHtoIbt68cvur/Lr6lA7QWbKYmuo6obLBWSOE=;
 b=rsz95uPTNZh+JdB8CLWC6qLG63pnZr1bxJjzRKHU+1EylelvqXWbMLyr9emKv31nvN9s1+vc6o4ZKGKKxYb+Y2TveLBJpPNNvGyTo1PKWg/8ddUio8nnE4iUUWtH7w/sQJiwYvcSUX10chAMqh+DIi5dIPCPP6dhelALrG6xRGY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDU6MDI6MjFQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBIaSBldmVyeW9uZSwKPiAKPiB0aGlzIHNlcmllcyBpcyB0aGUgbmV4dCBwdXp6
bGUgcGllY2UgZm9yIHJlY292ZXJhYmxlIHBhZ2UgZmF1bHQgaGFuZGxpbmcgb24gVmVnYSBhbmQg
TmF2aS4KPiAKPiBJdCBhZGRzIGEgbmV3IGRpcmVjdCBzY2hlZHVsZXIgZW50aXR5IGZvciBWTSB1
cGRhdGVzIHdoaWNoIGlzIHRoZW4gdXNlZCB0byB1cGRhdGUgcGFnZSB0YWJsZXMgZHVyaW5nIGEg
ZmF1bHQuCj4gCj4gSW4gb3RoZXIgd29yZHMgcHJldmlvdXNseSBhbiBhcHBsaWNhdGlvbiBkb2lu
ZyBhbiBpbnZhbGlkIG1lbW9yeSBhY2Nlc3Mgd291bGQganVzdCBoYW5nIGFuZC9vciByZXBlYXQg
dGhlIGludmFsaWQgYWNjZXNzIG92ZXIgYW5kIG92ZXIgYWdhaW4uIE5vdyB0aGUgaGFuZGxpbmcg
aXMgbW9kaWZpZWQgc28gdGhhdCB0aGUgaW52YWxpZCBtZW1vcnkgYWNjZXNzIGlzIHJlZGlyZWN0
ZWQgdG8gdGhlIGR1bW15IHBhZ2UuCj4gCj4gVGhpcyBuZWVkcyB0aGUgZm9sbG93aW5nIHByZXJl
cXVpc2l0ZXM6Cj4gYSkgVGhlIGZpcm13YXJlIG11c3QgYmUgbmV3IGVub3VnaCBzbyBhbGxvdyBy
ZS1yb3V0aW5nIG9mIHBhZ2UgZmF1bHRzLgo+IGIpIEZhdWx0IHJldHJ5IG11c3QgYmUgZW5hYmxl
ZCB1c2luZyB0aGUgYW1kZ3B1Lm5vcmV0cnk9MCBwYXJhbWV0ZXIuCgpJbiBteSBzaWRlLCBJIGZv
dW5kICJub3RyZXRyeSIgcGFyYW1ldGVyIG5vdCB3b3JrYWJsZSBmb3Igdm1pZCAwIHZtIGZhdWx0
cy4KSWYgdGhlIHNhbWUgb2JzZXJ2YXRpb24gaW4geW91ciBzaWRlLCBJJ2QgbGlrZSBnaXZlIGEg
Y2hlY2suCgpUaGFua3MsClJheQoKCj4gYykgRW5vdWdoIGZyZWUgVlJBTSB0byBhbGxvY2F0ZSBw
YWdlIHRhYmxlcyB0byBwb2ludCB0byB0aGUgZHVtbXkgcGFnZS4KPiAKPiBUaGUgcmUtcm91dGlu
ZyBvZiBwYWdlIGZhdWx0cyBjdXJyZW50IG9ubHkgd29ya3Mgb24gVmVnYTEwLCBzbyBWZWdhMjAg
YW5kIE5hdmkgd2lsbCBzdGlsbCBuZWVkIHNvbWUgbW9yZSB0aW1lLgo+IAo+IFBsZWFzZSByZXZp
ZXcgYW5kL29yIGNvbW1lbnQsCj4gQ2hyaXN0aWFuLgo+IAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
