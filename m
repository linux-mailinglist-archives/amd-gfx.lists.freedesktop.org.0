Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAD7B0994
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 09:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EA26EC04;
	Thu, 12 Sep 2019 07:36:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720080.outbound.protection.outlook.com [40.107.72.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B6D6EC04
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 07:36:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bf9FRVR77LZl5VhtnGeTDkUxGkUJNI6+TnWwmHgG6qTGxS+W5ej5U+JQuQQTRlHtAvutzXQzRaLVbwY32InFX6w1kW2QnHI10A1RgbfWKj9/ithbMXrUROnMLxSqE3uLQ3+3oH6sSO7UScz89KKPZAFOPt8gTsLLlHdRpQI3k6/xgEsQnOGWc8HV4zBxl9Mo2DznjqUQvUeJw7rC8vQyNA6YB3RXQN0sfzjv86CoNyIZQX2jGZjJjiUO85hJIpPSJJaWGbb/ZgpP24/aodFOHpOPStjwSoVSU7mHewEyDAbL/MTrlcmza60v7DQChxkaHVL9okwzl4vY6ojFK363CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3LRHCouAf/NTXPbItixCq8/0j+LAyVC2574BuQ+vYg=;
 b=b7RX4f0sDL9m55vVZ7cc5ea4AeYrQqFg6oyKqhsE5idS78ViTQ/yciuRDmJYYPxu7d4uP9sTweDmaRgXAlowooHZyo599p3zwDh+PNYEZjIE7TGNJIgNg1FKvZwyI3Voe46JWb/lsIFWMGk9uB6qaM2FGrUDhhI3OYe4KtWuw5jbtqN7ufiEHFqefaAdqcEpfZ8K4L7bLm/tcj9WtzgNUShcgrSWkpmmGayO0KqGp4rbfC+5mSTmV84wL/5ELWM4dzBvqUPM+LNPOPz+XBZGn0d8PQRva0L6zGflcSg5OfHtyo3AiMXy6JcBZY6dQTjKHkY2O4l0okQ/brCWaAQ4sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Thu, 12 Sep 2019 07:36:39 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e%7]) with mapi id 15.20.2241.018; Thu, 12 Sep 2019
 07:36:39 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Zhao, Jiange" <Jiange.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Navi10/12 VF doesn't support SMU
Thread-Topic: [PATCH] drm/amdgpu: Navi10/12 VF doesn't support SMU
Thread-Index: AQHVaRyQIBYp6rkFskGIMadpDLUH06cnpznA
Date: Thu, 12 Sep 2019 07:36:39 +0000
Message-ID: <MN2PR12MB2975CA9ACF71F3FD9E5533318FB00@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <20190912034527.15762-1-jianzh@amd.com>
In-Reply-To: <20190912034527.15762-1-jianzh@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e18a7de2-6086-4bec-213c-08d73753f342
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3054; 
x-ms-traffictypediagnostic: MN2PR12MB3054:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3054D4DE9F74876DE7D2C0468FB00@MN2PR12MB3054.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:201;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(199004)(13464003)(189003)(86362001)(33656002)(14454004)(66476007)(71190400001)(64756008)(7736002)(76176011)(9686003)(7696005)(316002)(6506007)(54906003)(26005)(186003)(11346002)(110136005)(446003)(476003)(478600001)(99286004)(486006)(102836004)(71200400001)(256004)(81156014)(66446008)(81166006)(52536014)(66066001)(3846002)(6116002)(229853002)(6436002)(66946007)(2906002)(74316002)(305945005)(8676002)(5660300002)(55016002)(76116006)(53936002)(2501003)(66556008)(6246003)(25786009)(4326008)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3054;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R1qhhQoLAoZQW0KJNtmh7mAAQ61ihA8Bqdazy7zF8poJR58UkgJPDC6ZcT7rrLPBO9iJIIUE0Sf0uVPv/ta1a+WyEl8Ax/ehy2XmW1QilcE8Mv3cuypVNDyqG9Ddlun2f3xmYDIAhi6pAPt+FQ9/NfX0kUnhzfxvIRZaruSn456M/feyWzsaMVZWtXqy6VvcFUgMnPagBfULqQRvAzJ5VVN4xAlgeVfXS/nLdcvaBvZDMG33uMT/Brcnkb417xEAS9JgpdVEVjfyErsqqJzVqnhnjGETHRtyJxqRtzDuwy7NR4ePJRyAWQCIW/UT+WhN+gs+uoFGBz6MwEhcF5xZEHIeGv49wfw+qV2WSc5nPtLHdij7qzLpRyBGOqaDJzIAvBgvaQw+c1EZIMimbU7xViENKwxGhpEiwzgJxbQ/qfQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18a7de2-6086-4bec-213c-08d73753f342
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 07:36:39.6076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1J7fHiZuV2lJxu5j0Z5ICmFnNQmaXGG8sPVN8wwlqaIdHof1Gy8BBvYuNosDIXlx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3LRHCouAf/NTXPbItixCq8/0j+LAyVC2574BuQ+vYg=;
 b=UxHVNQ1PPUFuaeLT5DR15+g86gH+KoNgfgqoos0tF24nBaCZW4z293/u/Koe93lcPIeEPR+15QmVTaQUoyvP2YHFGdlI4f6b+sXx+vzwRxAEEDKBlOQTWIwu8n68ETtVUmE/Wrn994QqAmwNOjG2ruD2ebIXqKUoFOzlWvvMNWM=
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>, "Nieto,
 David M" <David.Nieto@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4KCkJlc3Qgd2lzaGVz
CkVtaWx5IERlbmcKCgoKPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj5Gcm9tOiBaaGFvLCBK
aWFuZ2UgPEppYW5nZS5aaGFvQGFtZC5jb20+Cj5TZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDEy
LCAyMDE5IDExOjQ2IEFNCj5UbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPkNjOiBO
aWV0bywgRGF2aWQgTSA8RGF2aWQuTmlldG9AYW1kLmNvbT47IERlbmcsIEVtaWx5Cj48RW1pbHku
RGVuZ0BhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNv
bT47Cj5aaGFvLCBKaWFuZ2UgPEppYW5nZS5aaGFvQGFtZC5jb20+Cj5TdWJqZWN0OiBbUEFUQ0hd
IGRybS9hbWRncHU6IE5hdmkxMC8xMiBWRiBkb2Vzbid0IHN1cHBvcnQgU01VCj4KPkZyb206IEpp
YW5nZSBaaGFvIDxKaWFuZ2UuWmhhb0BhbWQuY29tPgo+Cj5JbiBTUklPViBjYXNlLCBTTVUgYW5k
IHBvd2VycGxheSBhcmUgaGFuZGxlZCBpbiBIVi4KPgo+VkYgc2hvdWxkbid0IGhhdmUgY29udHJv
bCBvdmVyIFNNVSBhbmQgcG93ZXJwbGF5Lgo+Cj5TaWduZWQtb2ZmLWJ5OiBKaWFuZ2UgWmhhbyA8
SmlhbmdlLlpoYW9AYW1kLmNvbT4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252
LmMgfCA4ICsrKystLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMK
PmIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBpbmRleCA0YzI0NjcyYmUxMmEuLmZi
MDk3YWEwODlkYQo+MTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5j
Cj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCj5AQCAtNDM4LDcgKzQzOCw3
IEBAIGludCBudl9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+IAkJ
YW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJm5hdmkxMF9paF9pcF9ibG9jayk7Cj4g
CQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmcHNwX3YxMV8wX2lwX2Jsb2NrKTsK
PiAJCWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQICYm
Cj4tCQkgICAgaXNfc3VwcG9ydF9zd19zbXUoYWRldikpCj4rCQkgICAgaXNfc3VwcG9ydF9zd19z
bXUoYWRldikgJiYgIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkKPiAJCQlhbWRncHVfZGV2aWNlX2lw
X2Jsb2NrX2FkZChhZGV2LAo+JnNtdV92MTFfMF9pcF9ibG9jayk7Cj4gCQlpZiAoYWRldi0+ZW5h
YmxlX3ZpcnR1YWxfZGlzcGxheSB8fCBhbWRncHVfc3Jpb3ZfdmYoYWRldikpCj4gCQkJYW1kZ3B1
X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwKPiZkY2VfdmlydHVhbF9pcF9ibG9jayk7IEBAIC00
NDksNyArNDQ5LDcgQEAgaW50IG52X3NldF9pcF9ibG9ja3Moc3RydWN0Cj5hbWRncHVfZGV2aWNl
ICphZGV2KQo+IAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmdmeF92MTBfMF9p
cF9ibG9jayk7Cj4gCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc2RtYV92NV8w
X2lwX2Jsb2NrKTsKPiAJCWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZX
X0xPQURfRElSRUNUCj4mJgo+LQkJICAgIGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKQo+KwkJICAg
IGlzX3N1cHBvcnRfc3dfc211KGFkZXYpICYmICFhbWRncHVfc3Jpb3ZfdmYoYWRldikpCj4gCQkJ
YW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwKPiZzbXVfdjExXzBfaXBfYmxvY2spOwo+
IAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnZjbl92Ml8wX2lwX2Jsb2NrKTsK
PiAJCWlmIChhZGV2LT5lbmFibGVfbWVzKQo+QEAgLTQ2MSw3ICs0NjEsNyBAQCBpbnQgbnZfc2V0
X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAJCWFtZGdwdV9kZXZpY2Vf
aXBfYmxvY2tfYWRkKGFkZXYsICZuYXZpMTBfaWhfaXBfYmxvY2spOwo+IAkJYW1kZ3B1X2Rldmlj
ZV9pcF9ibG9ja19hZGQoYWRldiwgJnBzcF92MTFfMF9pcF9ibG9jayk7Cj4gCQlpZiAoYWRldi0+
ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX1BTUCAmJgo+LQkJICAgIGlzX3N1
cHBvcnRfc3dfc211KGFkZXYpKQo+KwkJICAgIGlzX3N1cHBvcnRfc3dfc211KGFkZXYpICYmICFh
bWRncHVfc3Jpb3ZfdmYoYWRldikpCj4gCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRl
diwKPiZzbXVfdjExXzBfaXBfYmxvY2spOwo+IAkJaWYgKGFkZXYtPmVuYWJsZV92aXJ0dWFsX2Rp
c3BsYXkgfHwgYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQo+IAkJCWFtZGdwdV9kZXZpY2VfaXBfYmxv
Y2tfYWRkKGFkZXYsCj4mZGNlX3ZpcnR1YWxfaXBfYmxvY2spOyBAQCAtNDcyLDcgKzQ3Miw3IEBA
IGludCBudl9zZXRfaXBfYmxvY2tzKHN0cnVjdAo+YW1kZ3B1X2RldmljZSAqYWRldikKPiAJCWFt
ZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnZnhfdjEwXzBfaXBfYmxvY2spOwo+IAkJ
YW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNkbWFfdjVfMF9pcF9ibG9jayk7Cj4g
CQlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX0RJUkVDVAo+
JiYKPi0JCSAgICBpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkKPisJCSAgICBpc19zdXBwb3J0X3N3
X3NtdShhZGV2KSAmJiAhYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQo+IAkJCWFtZGdwdV9kZXZpY2Vf
aXBfYmxvY2tfYWRkKGFkZXYsCj4mc211X3YxMV8wX2lwX2Jsb2NrKTsKPiAJCWFtZGdwdV9kZXZp
Y2VfaXBfYmxvY2tfYWRkKGFkZXYsICZ2Y25fdjJfMF9pcF9ibG9jayk7Cj4gCQlicmVhazsKPi0t
Cj4yLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
