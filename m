Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E91CBE2E
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 16:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB0E6E30E;
	Fri,  4 Oct 2019 14:56:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800070.outbound.protection.outlook.com [40.107.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF086EBC4
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 14:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPXzPOKQzsi5hjPuQX4+iCrGYEe8OxhrO0nBR+BexCF6k65CpWqppS9TsV6s8eFPttoQJ4p9eGWBh5BpaKxIsQIJoatXOb4TUIbMV8A6hQNT5eFBhn7RUKSjIuMYqUrYbT1k+148XgCLyxh3CfzJvF8dS82C9cfBxcGUgkBIjbwZivonuldS2s+9mjQiXNCFcBOk4LlU91oB2/2G/AQ9gQ1Uvy/CuGIBUlnmVLI7A1szFjjPmzbXZ0k14o1MMu/StcZnQzaY6oTg8c1PHD0Ro6HxeFCclSiFeISSEetMZ0cIUbMESqVl3Ld5Qqxscr6dZSafqJaadQsfT/FOXwHLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBzshMnZSzwKrvt2nRqSivVG7Sh0K6YLs6U7NJ7p3Pc=;
 b=jyqJSZcRsXtDjKXUeZO4Al4Ulo2Yec+bnPd5bqkKs1Fn3MO80HM/m0XXOMoSkiqSNF7iht0OgAhGx5GuBU7YNZhrtCmqoq5GHp/zIAXMt+2T3AxYMovJRyuOnzognBNUlmYNBi+8OtrtXwsf66L+6qlTrdr45r2jN38LkAlXxfM0al/wPIJcyThK+7YiTzR1KRgJFQrtgTo4Nd+eQe+9+tZqvd6pO9SFus54bg6ADNBYrl3WCKnpLi1SOI+/Krxa2YQ+A6vrfNJiKzyXn1vGFLADQLwv+Bb8ZcPJj2JnOvrALCDAmOWCYMC5v6VGF0vsudik+g0steejb+xc8VNeAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0SPR01MB0013.namprd12.prod.outlook.com (52.132.26.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Fri, 4 Oct 2019 14:56:15 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4%6]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 14:56:15 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Enable gfx cache probing on HDP write for
 arcturus
Thread-Topic: [PATCH] drm/amdgpu: Enable gfx cache probing on HDP write for
 arcturus
Thread-Index: AQHVby+cOrlga564PUeguQaR/P1as6dKqVOQ
Date: Fri, 4 Oct 2019 14:56:15 +0000
Message-ID: <BL0PR12MB2580DFF062B6AE6A61C3AFBC809E0@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <1568927828-17593-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1568927828-17593-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e678ef92-7dc3-4f76-1e34-08d748db0142
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0SPR01MB0013:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0SPR01MB0013A6408F781B8F3977DA1F809E0@BL0SPR01MB0013.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:341;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(13464003)(199004)(189003)(7696005)(3846002)(305945005)(76176011)(102836004)(6506007)(6116002)(53546011)(71190400001)(71200400001)(7736002)(186003)(74316002)(99286004)(6436002)(5660300002)(66946007)(64756008)(2906002)(76116006)(66446008)(66476007)(52536014)(66556008)(26005)(256004)(14444005)(5640700003)(11346002)(66066001)(54906003)(486006)(446003)(316002)(4326008)(25786009)(2501003)(86362001)(8936002)(81166006)(81156014)(8676002)(6246003)(6916009)(478600001)(14454004)(2351001)(9686003)(476003)(229853002)(55016002)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0SPR01MB0013;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j/XVTJQB7jS4nEZzoj9OnKwlghO3r+0e/4bNIl44ldtegwlJeC8Bx9/pOFHzkh5y9ebSsalJRuIwu19w3a7We3o36VCm9vgIS5ry8udEIyNeHaD80mWf3/YSM4VU3Po+C5dKpDIKpHZAHC7wohoy5RbPqw42Oylc5HS4tli9u95ETPPWC8BGvXHm56iU5KK2IRxni/22CTH6gY9KAekT++wA9gX1Nx49ziVO+JNU2xzqlvrV3UB3KVxUKVNAZxhX+tcWy9AOJefxpy7muKq3qObrQHfufQ/yWfojWgYv3TSD6pOpgi5SWceptW8zNNzzv/1P/qFMTIK9LrQcHtc7eRu5pf3IhNXm5byJ39elyVlZnff76dqX1YZy3D/qqBnusAZMdrLWPkF8Nj3EBlwsSAG4qIhDqIG+qzBG1v3BFLM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e678ef92-7dc3-4f76-1e34-08d748db0142
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 14:56:15.0773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AtVjS1zN3m7HFPMWnV/mgG84Qk07ZZdMD7jv0wiX8dhe6+fDOCgUPQt+jt7FyzmI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0SPR01MB0013
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBzshMnZSzwKrvt2nRqSivVG7Sh0K6YLs6U7NJ7p3Pc=;
 b=DvkE3zT4byqBiXPp+gqSCqEhJqHrjMQjIa2xtWp/QWSpoqtHLkryFwtOsFc3BFGgZtSlJs/gpZ1XbUl1FCzZSToCFaHh6hOx/p193q1f+XtXtp/foJA3g9h6wM2A5hwnTY6R2M/o1iwfnWjhaIIQom8d5DredoDSShYsjDSpr+U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZy4uLgoKUmVnYXJkcywKT2FrCgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBa
ZW5nLCBPYWsgPE9hay5aZW5nQGFtZC5jb20+IApTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDE5
LCAyMDE5IDU6MTcgUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBLdWVo
bGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbiA8
Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgWmVuZywgT2FrIDxPYWsuWmVuZ0BhbWQuY29tPgpT
dWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IEVuYWJsZSBnZnggY2FjaGUgcHJvYmluZyBvbiBI
RFAgd3JpdGUgZm9yIGFyY3R1cnVzCgpUaGlzIGFsbG93cyBnZnggY2FjaGUgdG8gYmUgcHJvYmVk
IGFuZCBpbnZhbGlkYXRlZCAoZm9yIG5vbmUtZGlydHkgY2FjaGUgbGluZXMpIG9uIGEgSERQIHdy
aXRlIChmcm9tIGVpdGhlciBhbm90aGVyIEdQVSBvciBDUFUpLiBUaGlzIHNob3VsZCB3b3JrIG9u
bHkgZm9yIHRoZSBtZW1vcnkgbWFwcGVkIGFzIFJXIG1lbW9yeSB0eXBlIG5ld2x5IGFkZGVkIGZv
ciBhcmN0dXJ1cywgdG8gYWNoaWV2ZSBzb21lIGNhY2hlIGNvaGVyZW5jZSBiL3QgbXVsdGlwbGUg
bWVtb3J5IGNsaWVudHMuCgpDaGFuZ2UtSWQ6IEkwYTY5ZDAwMDBlNDg3MDZiYjcxMzIzNWJmYmM4
M2ZjYzY3Nzc0NjE0ClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCAzICsrKwogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jCmluZGV4IDU3ZDc2ZWUuLmUwMWEzNTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYwpAQCAtMTI3Miw2ICsxMjcyLDkgQEAgc3RhdGljIGludCBnbWNfdjlfMF9nYXJ0X2Vu
YWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJLyogVE9ETyBmb3IgcmVub2lyICov
CiAJCW1taHViX3YxXzBfdXBkYXRlX3Bvd2VyX2dhdGluZyhhZGV2LCB0cnVlKTsKIAkJYnJlYWs7
CisJY2FzZSBDSElQX0FSQ1RVUlVTOgorCQlXUkVHMzJfRklFTEQxNShIRFAsIDAsIEhEUF9NTUhV
Ql9DTlRMLCBIRFBfTU1IVUJfR0NDLCAxKTsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJYnJlYWs7
CiAJfQotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
