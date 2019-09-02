Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01998A4D4E
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 04:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39473895C1;
	Mon,  2 Sep 2019 02:25:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720059.outbound.protection.outlook.com [40.107.72.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDB6895C1
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 02:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNVpstB46Uw3m/HNCpcWSBN/0/i9g7GPi6vYTiFbD5pJyH4gDStz/zE5uhYnlhiK+EVXMy163Fzix6iK0Y8vGjezchCAIMeY2sN8JTaU/EZdkO1OEb3RJgyHz08+RE8oz6FFFQW3e9AsrqC8f3qvOuE4no9GVJI+q0bT6Ac3jNwwAPAElf8Rvl4g5o1XCIoQL9djodyYcGCkq0Iouv2NRig/YMm68UjedwFz/anGn+6Wp4mVrKoYU/meUvGZeUr80iHmI+ci3wxXx42rFLD9fuFo+e59K9EJZA/7bn8/FDra85h7HUvH68lR+R/SxvD7k1Nwn8PfRi4yYhueI92ugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMf2ogAGtr/9wgSRX/TJMfMSJFx74hBBIdjnxq5HeB4=;
 b=kRHWL6CznIaBDWDo8Jj39E1m/qLoyq2x7Tv+UEacOX1Ew2eecafYH79jrOL6j21cud0/mQpCKLBOP8Q/NSi0KAprW9mkKUC4TSPHF9Y2wK/oIinFS3+cOZ6VbFBQfcUazsG2UxAQLo6GokbDbLmCQvaxe4hysCGDkuJl6jFSn8t+HaXiO8YK+wMhFb5paFH/6Hyo5icwDQe4BOZkzzwFkmlXoMledGmHIJd5EPr4G3SClf1RusWxNmutg99fzfcHvlmctBRUcVqQXJ/bDAZb8nKJEXxdv6ihqFpyYTsw0G0XjwyLj6Hokmw1l3LBJ3GqIYkiZj6Yna1WSg5vhiHuCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN6PR12MB2813.namprd12.prod.outlook.com (52.135.100.27) by
 SN6PR12MB2734.namprd12.prod.outlook.com (52.135.107.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Mon, 2 Sep 2019 02:25:01 +0000
Received: from SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::b806:60aa:1bb:9117]) by SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::b806:60aa:1bb:9117%3]) with mapi id 15.20.2199.021; Mon, 2 Sep 2019
 02:25:00 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 0/4] add support for ras page retirement
Thread-Topic: [PATCH 0/4] add support for ras page retirement
Thread-Index: AQHVXy37Ll2LechnPEaRs5R0n0fuOqcXrJSg
Date: Mon, 2 Sep 2019 02:25:00 +0000
Message-ID: <SN6PR12MB2813049EDB080477C4A6D6D0F1BE0@SN6PR12MB2813.namprd12.prod.outlook.com>
References: <20190830122453.19703-1-tao.zhou1@amd.com>
In-Reply-To: <20190830122453.19703-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 050b4be0-01c7-4d03-0caf-08d72f4cc1af
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2734; 
x-ms-traffictypediagnostic: SN6PR12MB2734:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2734B5D9ED99795AB76DA498F1BE0@SN6PR12MB2734.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(199004)(189003)(13464003)(102836004)(6116002)(966005)(478600001)(3846002)(6506007)(8936002)(8676002)(81166006)(305945005)(74316002)(14454004)(316002)(6436002)(6636002)(2906002)(52536014)(110136005)(2501003)(99286004)(6306002)(9686003)(53936002)(55016002)(186003)(71200400001)(7696005)(71190400001)(76176011)(6246003)(446003)(66946007)(25786009)(86362001)(33656002)(53546011)(256004)(476003)(486006)(66476007)(4326008)(81156014)(76116006)(64756008)(7736002)(229853002)(5660300002)(66066001)(26005)(66446008)(11346002)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2734;
 H:SN6PR12MB2813.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vRCJn1WvYe6lC/xPeql3TorJJnisd7HUa6Picgki7eFfYDqganR8Zb2NSnhZBxwXmD8h62Q9ihB0JwykXGEzTOjuax1ngVdCMzdLeYEieTiE9Xe5hK1ffyZD27pb6wJJfG5y3Ky+1D8VNXXZMAMQ/z7jbSQGJkE0RR2wNosfOBDLqBHvxDskrDGGvD7987dt2h2oinTcjq1ijs1nu9Dq7wjgpUqcLeYrVDbKEkWGxwfTFSZdYIMmaLUGZ3YFUi0E5reuK7bg2SW/+XQt38rr+YaupsDkAwNP9HaqJkRKZ0YyC5SYWEz3a3lCOoHCXgs+t3hEQlBvE2mEVCGeL8Uu3TCGeJJgpYkDp156UVM/XELjFd1ufheOZRajbFaTj8w3Df1nbKYl+YVJh9JTKgAtAyC/P2ooWsp+JPArKsQwDxw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050b4be0-01c7-4d03-0caf-08d72f4cc1af
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 02:25:00.8909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0tZilvgFwjP5KHO4JLr3o9ebwoZeEaYhpHbdxb65CKMI0u/hDvbdSynWh1q41CCkgXMvBoY6It9yqHLPTEN+oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2734
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMf2ogAGtr/9wgSRX/TJMfMSJFx74hBBIdjnxq5HeB4=;
 b=UuZpC755Iw1o9+OQih+JA4bOAfr7zOxJselFFE7YEOj+/qgYAJndUEo/8KicZJjgGtLjRZB9JTnr746L7NGgmPtb9+Cq5wZulFkOqynr+pYtun1dzXeDYSpkFPrLi5Zlidkd9wwlAHENhfT8ftf4814pkHIYNNpgvTZQlD3bFYQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWZ0ZXIgdGhlIG1pbm9yIGNvbW1lbnQgaXMgYWRkcmVzc2VkIGlzIFBhdGNoIDEgYW5kIHBhdGNo
IDIsIHRoZSBzZXJpZXMgYXJlOiBSZXZpZXdlZC1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVu
QGFtZC5jb20+DQoNClJlZ2FyZHMsDQpHdWNodW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+
IE9uIEJlaGFsZiBPZiBUYW8gWmhvdQ0KU2VudDogRnJpZGF5LCBBdWd1c3QgMzAsIDIwMTkgODoy
NSBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBHcm9kem92c2t5LCBBbmRy
ZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVu
QGFtZC5jb20+OyBMaSwgRGVubmlzIDxEZW5uaXMuTGlAYW1kLmNvbT47IFpoYW5nLCBIYXdraW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQpDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5j
b20+DQpTdWJqZWN0OiBbUEFUQ0ggMC80XSBhZGQgc3VwcG9ydCBmb3IgcmFzIHBhZ2UgcmV0aXJl
bWVudA0KDQpUaGlzIHNlcmllcyBzYXZlcyB1bWMgZXJyb3IgcGFnZSBpbmZvIGludG8gYSByZWNv
cmQgc3RydWN0dXJlIGFuZCBzdG9yZXMgcmVjb3JkcyB0byBlZXByb20sIGl0IGFsc28gbG9hZHMg
ZXJyb3IgcmVjb3JkcyBmcm9tIGVlcHJvbSBhbmQgcmVzZXJ2ZXJzIHJlbGF0ZWQgcmV0aXJlZCBw
YWdlcyBkdXJpbmcgZ3B1IGluaXQuDQoNCg0KVGFvIFpob3UgKDQpOg0KICBkcm0vYW1kZ3B1OiBj
aGFuZ2UgcmFzIGJwcyB0eXBlIHRvIGVlcHJvbSB0YWJsZSByZWNvcmQgc3RydWN0dXJlDQogIGRy
bS9hbWRncHU6IEhvb2sgRUVQUk9NIHRhYmxlIHRvIFJBUw0KICBkcm0vYW1kZ3B1OiBzYXZlIHVt
YyBlcnJvciByZWNvcmRzDQogIGRybS9hbWRncHU6IG1vdmUgdGhlIGNhbGwgb2YgcmFzIHJlY292
ZXJ5X2luaXQgYW5kIGJhZCBwYWdlIHJlc2VydmUgdG8NCiAgICBwcm9wZXIgcGxhY2UNCg0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8ICAxNiArLQ0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyAgICB8IDE3MCArKysrKysrKysrKysr
KystLS0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggICAgfCAg
MTggKystDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgICAgIHwgIDI5
ICsrKy0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jICAgICAgfCAgMzkg
KysrKy0NCiA1IGZpbGVzIGNoYW5nZWQsIDIwMiBpbnNlcnRpb25zKCspLCA3MCBkZWxldGlvbnMo
LSkNCg0KLS0NCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
