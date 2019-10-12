Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C6D4D40
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 07:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391546E448;
	Sat, 12 Oct 2019 05:36:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720066.outbound.protection.outlook.com [40.107.72.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2196A6E448
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Oct 2019 05:36:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNpQtn4kcZJRbwZq5oQsxIOANtgx9SEmIS5lJy7tb0WdPW+kpCmmcqBg4dbgzP1TL7Ccyk93zknUX5QCV45e4nVq1JqitVseZ+Ybgjmuz31SznCz7w/6fVzMaNDHUM4zXbyZXfgxKuR+8nfTnmz66TaZiDuRwqO1XVc+urLU+zH6eUzfwXQNuA/S4HrQPQRPt2hDcari5EqwUufZvS7e4teX69lqx5ksJe/cXbK3tXnOe7bUP5jwq6i/uHZYAHeUELE5Bvi7LNK0Fi4Le2lnKRh8pFrb+loZOCZ5epv4c0l+T+0rfWDfQexHQK5UK+/NfRdhecOgIjJrnxyyMiImlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STGv3F83Fi3ATVo03/MCCkh75b6btU+5YvuCrKJVzhU=;
 b=eGasLSJX4uI9Mj4hhyqezQZWpyfp29bgcEXCCfu+ue+Ky+VLmxMY4H5/zPu+2nSvK8YjIiWgPpbODy3lv6JO9biPQZUYZQaO4lKzRakhuRqh/n/Anu0C1v/35puHSDYx7mXMSiNOIMNC7qAIS6uWR4Vo/OfCxrz4d6ah02tyaK3bsYCC9AvR4LuaVQXl7Uz5TQUSmkCaoP4ucopDP6nMl2v6cMohR6/a+tGv9lDoLPSfTYnAYCcnOevL/n0KP5ouAo5bhLQ7267GbNPLbJh+PcKyZ1QBS+tFBE9WjzkCZu1TeCU88opCDjyabn2Dj7NBUp23TM3SjdwwMXPg0DzHHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB4080.namprd12.prod.outlook.com (52.135.50.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Sat, 12 Oct 2019 05:36:08 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::1b9:96b5:4853:b289]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::1b9:96b5:4853:b289%7]) with mapi id 15.20.2347.021; Sat, 12 Oct 2019
 05:36:08 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] SWDEV-206718 drm/amdgpu: Fix tdr3 could hang with slow
 compute issue
Thread-Topic: [PATCH] SWDEV-206718 drm/amdgpu: Fix tdr3 could hang with slow
 compute issue
Thread-Index: AQHVfo+UlmrY2WyZkkG68fz0vKW8P6dWgLrA
Date: Sat, 12 Oct 2019 05:36:08 +0000
Message-ID: <MN2PR12MB2975AFBB743A6C57493F96878F960@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1570618306-11560-1-git-send-email-Emily.Deng@amd.com>
In-Reply-To: <1570618306-11560-1-git-send-email-Emily.Deng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abc4538e-6b2e-448f-a023-08d74ed61563
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4080:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB40802550F122ADBE69BD75448F960@MN2PR12MB4080.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(189003)(199004)(13464003)(229853002)(99286004)(6506007)(7696005)(76176011)(33656002)(6116002)(3846002)(6436002)(26005)(2906002)(9686003)(102836004)(186003)(55016002)(74316002)(305945005)(7736002)(256004)(86362001)(2501003)(8936002)(8676002)(316002)(110136005)(66066001)(71190400001)(71200400001)(11346002)(476003)(6246003)(446003)(52536014)(14454004)(25786009)(66946007)(66476007)(66556008)(64756008)(5660300002)(486006)(478600001)(66446008)(76116006)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4080;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mp6CB6q/MEpKv0WB5dr+HwyBuOAoR4IDYKYsN092hxSrUc92DxlLsuhBF/fXp2J9y7g/TQP01KFK9tyTGfgMcQZNdjD46OCE3uHrQfBRcDoja/VjNUTOHRG+8NRDQ1cfKVukvEpfac34Dqy1tCPqc/BDPmKnsiEa/DLfKCVU9NsBpLbwPje9qyN7HajA+oHY4llKEO8UM5mN7w11TCFhYEmVJOKSpQ118YXXHG7wNrJ6nZB3Eg1jsOL0q9pzuKURVidCovlWQmeZ3GbZBVx7vl3eiIPUIjsmi4s9Rj4lmD75HU26ktO9qn+TIBqsYHz+rZIFb8hZ63Sb8OPDj68HY2Bhl54H17LLxQtTMh0ZN67295+qy6vS2kz1/WH3NwpqeLhzMhWubpga6IoNPM39KDUyniCQedkUDS/r8cPghe8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc4538e-6b2e-448f-a023-08d74ed61563
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 05:36:08.4053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: loj4Lmrxm0xcfO1JRvdTFxhbK9Vtb4DuwEgYSLsvGaGvEx3+QocEqz/Vn9Q9wYfU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STGv3F83Fi3ATVo03/MCCkh75b6btU+5YvuCrKJVzhU=;
 b=BxDPc72YQNn6XSFPD2YL8VYjXts/ONBB6Ce78xs7So6aMj2MW6BUc9H75bRDsv9T35IdNxjTwzIFdyK12s5EMoaOWrIQGzTfcjNu3wjNpxu2DsZcLEZJdorUPOGAk23uuOieXwpdH8ERAwADIncYsg6ZLwf+DKNEFnpIjEOeviM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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

UGluZy4uLi4KCkJlc3Qgd2lzaGVzCkVtaWx5IERlbmcKCgoKPi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj5Gcm9tOiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+Cj5TZW50OiBXZWRu
ZXNkYXksIE9jdG9iZXIgOSwgMjAxOSA2OjUyIFBNCj5UbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPkNjOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPgo+U3ViamVjdDog
W1BBVENIXSBTV0RFVi0yMDY3MTggZHJtL2FtZGdwdTogRml4IHRkcjMgY291bGQgaGFuZyB3aXRo
IHNsb3cKPmNvbXB1dGUgaXNzdWUKPgo+V2hlbiBpbmRleCBpcyAxLCBuZWVkIHRvIHNldCBjb21w
dXRlIHJpbmcgdGltZW91dCBmb3Igc3Jpb3YgYW5kIHBhc3N0aHJvdWdoLgo+Cj5TaWduZWQtb2Zm
LWJ5OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+Cj4tLS0KPiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA1ICsrKystCj4gZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgIHwgNiArKysrLS0KPiAyIGZpbGVzIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+Yi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPmluZGV4IDUzY2UyMjcuLjJmNWEwMTUgMTAwNjQ0Cj4t
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+QEAgLTI2NjQsOCArMjY2
NCwxMSBAQCBzdGF0aWMgaW50Cj5hbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5n
cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAJCSAqIFRoZXJlIGlzIG9ubHkgb25lIHZh
bHVlIHNwZWNpZmllZCBhbmQKPiAJCSAqIGl0IHNob3VsZCBhcHBseSB0byBhbGwgbm9uLWNvbXB1
dGUgam9icy4KPiAJCSAqLwo+LQkJaWYgKGluZGV4ID09IDEpCj4rCQlpZiAoaW5kZXggPT0gMSkg
ewo+IAkJCWFkZXYtPnNkbWFfdGltZW91dCA9IGFkZXYtPnZpZGVvX3RpbWVvdXQgPSBhZGV2LQo+
PmdmeF90aW1lb3V0Owo+KwkJCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikgfHwKPmFtZGdwdV9w
YXNzdGhyb3VnaChhZGV2KSkKPisJCQkJYWRldi0+Y29tcHV0ZV90aW1lb3V0ID0gYWRldi0+Z2Z4
X3RpbWVvdXQ7Cj4rCQl9Cj4gCX0KPgo+IAlyZXR1cm4gcmV0Owo+ZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+Yi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZHJ2LmMKPmluZGV4IGE4OGVhNzQuLjMxMWFiYzggMTAwNjQ0Cj4tLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+QEAgLTI1MCw5ICsyNTAsMTEgQEAgbW9k
dWxlX3BhcmFtX25hbWVkKG1zaSwgYW1kZ3B1X21zaSwgaW50LCAwNDQ0KTsKPiAgKiBCeSBkZWZh
dWx0KHdpdGggbm8gbG9ja3VwX3RpbWVvdXQgc2V0dGluZ3MpLCB0aGUgdGltZW91dCBmb3IgYWxs
IG5vbi0KPmNvbXB1dGUoR0ZYLCBTRE1BIGFuZCBWaWRlbykKPiAgKiBqb2JzIGlzIDEwMDAwLiBB
bmQgdGhlcmUgaXMgbm8gdGltZW91dCBlbmZvcmNlZCBvbiBjb21wdXRlIGpvYnMuCj4gICovCj4t
TU9EVUxFX1BBUk1fREVTQyhsb2NrdXBfdGltZW91dCwgIkdQVSBsb2NrdXAgdGltZW91dCBpbiBt
cyAoZGVmYXVsdDoKPjEwMDAwIGZvciBub24tY29tcHV0ZSBqb2JzIGFuZCBpbmZpbml0eSB0aW1l
b3V0IGZvciBjb21wdXRlIGpvYnMuIgo+K01PRFVMRV9QQVJNX0RFU0MobG9ja3VwX3RpbWVvdXQs
ICJHUFUgbG9ja3VwIHRpbWVvdXQgaW4gbXMgKGRlZmF1bHQ6Cj5mb3IgYmFyZSBtZXRhbCAxMDAw
MCBmb3Igbm9uLWNvbXB1dGUgam9icyBhbmQgaW5maW5pdHkgdGltZW91dCBmb3IgY29tcHV0ZQo+
am9iczsgIgo+KwkJImZvciBwYXNzdGhyb3VnaCBvciBzcmlvdiwgMTAwMDAgZm9yIGFsbCBqb2Jz
LiIKPiAJCSIgMDoga2VlcCBkZWZhdWx0IHZhbHVlLiBuZWdhdGl2ZTogaW5maW5pdHkgdGltZW91
dCksICIKPi0JCSJmb3JtYXQgaXMgW05vbi1Db21wdXRlXSBvciBbR0ZYLENvbXB1dGUsU0RNQSxW
aWRlb10iKTsKPisJCSJmb3JtYXQ6IGZvciBiYXJlIG1ldGFsIFtOb24tQ29tcHV0ZV0gb3IKPltH
RlgsQ29tcHV0ZSxTRE1BLFZpZGVvXTsgIgo+KwkJImZvciBwYXNzdGhyb3VnaCBvciBzcmlvdiBb
YWxsIGpvYnNdIG9yCj5bR0ZYLENvbXB1dGUsU0RNQSxWaWRlb10uIik7Cj4gbW9kdWxlX3BhcmFt
X3N0cmluZyhsb2NrdXBfdGltZW91dCwgYW1kZ3B1X2xvY2t1cF90aW1lb3V0LAo+c2l6ZW9mKGFt
ZGdwdV9sb2NrdXBfdGltZW91dCksIDA0NDQpOwo+Cj4gLyoqCj4tLQo+Mi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
