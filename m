Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B5BBC08C
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 04:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798EA6E9E5;
	Tue, 24 Sep 2019 02:58:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680059.outbound.protection.outlook.com [40.107.68.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18176E9E5
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 02:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbLgqXEh+Izn7muW57YIoFTYvyEHhPawG42TF/oTiu0d5l9gEHK1t+yEKHb+8cUbnop7xQN5cHQUbT+Akn+TxSOcRVKuUr32SkBZZQt30dQqu7VUe7wlpZvbAhYlUoDTgpFh+jzEXqhabrlq0xaw5JYPo3l2zEFiZF9jh9+5CTD9jjmAxSHQEaJ38OwNi5EqyfK8iG0/hulv5nq+h43F9MafpopOntVo8nuydBdeCyRSLU63ss/cKJhPKBfiZC+g8WIgNoL167+Kgqa7A76mDafDmz6TWEVQGR+g3TBT0Ogy4a+GcVspYayc3gZtjxEwNo6dcNl6S2E1CfZWfU9Giw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vuzqzETcaVJyJams/93FTspbqIYUGkSuOikY9Wl05w=;
 b=eZUw69CeqS2DTd/uMs266iz0CBZ+V7GtApsngsAiNl5Qb6H2FcmO68+kX44nAjB/ZOfPuIZvtfbM5qxq/sC+enYf1+LBEv8iVZ8dBN5vNdIM8TcakduaTBa7Kfj1ffG5dgH9c1WWTgiAEcnjM2Fgagqbw18wTrDIYNifkJOqjUXkJIjsqx7HXcsWzr7sM134SD2E1UmwszhMeV9t+qfXVvWUSzFnGz8SjQWOfBWbYYOgTmLDQgqdWzLzCt1B46ipVabV08kdvXNrCAzu+LQdSgsZ5+sdPswUNO7jEO0asSGTxyRm5iVFK0Qs3graCTPJ+/C2B70UpaKQVWZ31jGG/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3250.namprd12.prod.outlook.com (20.179.64.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Tue, 24 Sep 2019 02:58:44 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 02:58:43 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdgpu/gmc10: do not apply the 'invalidation from
 sdma' workaround for navi12
Thread-Topic: [PATCH 1/2] drm/amdgpu/gmc10: do not apply the 'invalidation
 from sdma' workaround for navi12
Thread-Index: AQHVchbuzvgxiyJrjU6lDBJ5+GFvFKc6E6nAgAAJauA=
Date: Tue, 24 Sep 2019 02:58:43 +0000
Message-ID: <BN8PR12MB3602D26BAD4996AFEC0D018F89840@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190923135746.8066-1-xiaojie.yuan@amd.com>,
 <MN2PR12MB33445D3B5780A31B2DC45B95E4840@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB33445D3B5780A31B2DC45B95E4840@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7697d53a-8064-49b7-d114-08d7409b1c74
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3250; 
x-ms-traffictypediagnostic: BN8PR12MB3250:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3250042DE51E4E302F24075489840@BN8PR12MB3250.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(13464003)(189003)(199004)(33656002)(478600001)(2906002)(14454004)(2501003)(86362001)(25786009)(305945005)(53546011)(7736002)(66946007)(66476007)(102836004)(476003)(66556008)(6506007)(99286004)(186003)(5660300002)(26005)(64756008)(6116002)(3846002)(7696005)(76116006)(76176011)(91956017)(66446008)(66066001)(9686003)(55016002)(52536014)(11346002)(446003)(74316002)(486006)(6436002)(6246003)(229853002)(4326008)(54906003)(71200400001)(316002)(71190400001)(110136005)(14444005)(8936002)(8676002)(81156014)(256004)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3250;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XjQPf6/J/TZSCUV7P6Rq9eXOyGvRQUedgixaOGMXojKCie0KSsBIjftFtsluE9lo2kTKheiSxgGZuKYMoTo3FbLSVn+tMl9INtE4FYUmV3OnKllz8U84shI923HwiGi/fepuXCnGoxby1C3n7I5Wq3weqtY69ZXdEmUoPh8wi4vaW0db6Qb+T+nuQE90KAOybYDaWLPB9C/Jedyyx6IgpzSuraueLirMVgEiNSt00294jaUzVfAB2yw68ffy0iowMkky37AwmRg4vrSdsS7wnQ7UKh7f0B5unkuFU1WMtKcO+7ddaS+LCgajyLEvX5p65ZhIuw23Mo1gT8xd0z6AqznjT0y3hyclH+OXFAIPvuTFTOYejSBmky6lDoVDXSITO3iIUKmMPOQZF0aFU2fQSOm4Iy9uWlS2m0SrkXtJEEM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7697d53a-8064-49b7-d114-08d7409b1c74
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 02:58:43.6141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wY6XYp8XD4TjFjcnTZKnf1SG/BwbOzt+oKINEaElmfoItTe6gsnfRDPun2J/p7Lp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3250
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vuzqzETcaVJyJams/93FTspbqIYUGkSuOikY9Wl05w=;
 b=GgQWm8I2W5ho+wt7873uTpulNsqNua5oLLJ34HKAvgxWvT/MduUBS94y8IR+0e5D5mN4SJ1ChIN1+Cx4uow4uuTqbbeu1pWMtEkJbtJNuu492pk90SU94OJJxSDcK0ft6Eqq5uvtbmwidlKvp3DiVK3JYGM+GHazCAICN7udyaA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T29wcywgeW91IGFyZSByaWdodCBFdmFuLiBJJ2xsIHNlbmQgYW5vdGhlciBwYXRjaC4KSXQncyBh
IGxpdHRsZSBjb3VudGVyLWludHVpdGl2ZSB0aGF0IGFzaWMgdHlwZSBpZCBvZiBuYXZpMTIgaXMg
bGFyZ2VyIHRoYW4gbmF2aTE0LgoKQlIsClhpYW9qaWUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KRnJvbTogUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+ClNl
bnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyNCwgMjAxOSAxMDowOSBBTQpUbzogWXVhbiwgWGlhb2pp
ZTsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IFpoYW5nLCBIYXdraW5nOyBYaWFv
LCBKYWNrOyBGZW5nLCBLZW5uZXRoOyBXYW5nLCBLZXZpbihZYW5nKQpTdWJqZWN0OiBSRTogW1BB
VENIIDEvMl0gZHJtL2FtZGdwdS9nbWMxMDogZG8gbm90IGFwcGx5IHRoZSAnaW52YWxpZGF0aW9u
IGZyb20gc2RtYScgd29ya2Fyb3VuZCBmb3IgbmF2aTEyCgpUaGUgcGF0Y2ggbWFrZXMgbWUgYSBs
aXR0bGUgY29uZnVzaW5nLgpBY2NvcmRpbmcgdG8gYXNpYyB0eXBlIGxpc3QsCiAgICAgICAgQ0hJ
UF9OQVZJMTAsICAgIC8qIDI1ICovCiAgICAgICAgQ0hJUF9OQVZJMTQsICAgIC8qIDI2ICovCiAg
ICAgICAgQ0hJUF9OQVZJMTIsICAgIC8qIDI3ICovCiAgICAgICAgQ0hJUF9MQVNULApiZWZvcmUg
dGhlIHNkbWEgd29ya2Fyb3VuZCBhcHBsaWVzIG9ubHkgZm9yIE5hdmkxMCBhbmQgTmF2aTE0KG5v
dCBOYXZpMTIpLgpIb3dldmVyLCBpdCBzZWVtcyB0aGlzIHBhdGNoIHJldmVyc2UgdGhlIGxvZ2lj
cyB0b3RhbGx5LiAgSXQgYXBwbGllcyB0aGUgd29ya2Fyb3VuZCBvbmx5IGZvciBOYXZpMTIuCgot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBZdWFuLCBYaWFvamllIDxYaWFvamllLll1
YW5AYW1kLmNvbT4KU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMjMsIDIwMTkgOTo1OCBQTQpUbzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+OyBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT47IEZlbmcsIEtl
bm5ldGggPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5j
b20+OyBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdAYW1kLmNvbT47IFl1YW4sIFhpYW9q
aWUgPFhpYW9qaWUuWXVhbkBhbWQuY29tPgpTdWJqZWN0OiBbUEFUQ0ggMS8yXSBkcm0vYW1kZ3B1
L2dtYzEwOiBkbyBub3QgYXBwbHkgdGhlICdpbnZhbGlkYXRpb24gZnJvbSBzZG1hJyB3b3JrYXJv
dW5kIGZvciBuYXZpMTIKCndoZW4gZ2Z4b2ZmIGlzIGVuYWJsZWQsIGFwcGx5aW5nIHRoaXMgd29y
a2Fyb3VuZCBtYWtlcyBzZG1hIGhhbmcgd2hpbGUgZW50ZXJpbmcgZGVza3RvcC4KClNpZ25lZC1v
ZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3YxMF8wLmMKaW5kZXggZWQxYzNiODgzZjZhLi4zODk3ZTBkMjg4MzggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCkBAIC0yOTEsNyArMjkxLDggQEAgc3RhdGljIHZvaWQg
Z21jX3YxMF8wX2ZsdXNoX2dwdV90bGIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQz
Ml90IHZtaWQsCgogICAgICAgIGlmICghYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfZW5hYmxlZCB8
fAogICAgICAgICAgICAhYWRldi0+aWJfcG9vbF9yZWFkeSB8fAotICAgICAgICAgICBhZGV2LT5h
c2ljX3R5cGUgPiBDSElQX05BVkkxNCB8fAorICAgICAgICAgICBhZGV2LT5hc2ljX3R5cGUgPT0g
Q0hJUF9OQVZJMTAgfHwKKyAgICAgICAgICAgYWRldi0+YXNpY190eXBlID09IENISVBfTkFWSTE0
IHx8CiAgICAgICAgICAgIGFkZXYtPmluX2dwdV9yZXNldCkgewogICAgICAgICAgICAgICAgZ21j
X3YxMF8wX2ZsdXNoX3ZtX2h1YihhZGV2LCB2bWlkLCBBTURHUFVfR0ZYSFVCXzAsIDApOwogICAg
ICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZhZGV2LT5tbWFuLmd0dF93aW5kb3dfbG9jayk7Ci0t
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
