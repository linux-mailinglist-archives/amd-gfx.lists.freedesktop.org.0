Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0051B9A040
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 21:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767726EA8E;
	Thu, 22 Aug 2019 19:40:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790054.outbound.protection.outlook.com [40.107.79.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F60F6EA8E
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 19:40:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jf7PDNbFFwEDBKnEaGgaJXWOfGHfUvL2lbh3mvGrE8XoKWOLkVLN/b/frfxUIhDnirC97dkkx/+r3l6VgeIKicAh0a/O7PHrPXk9yyLjxTUXNGrwwlp22bpKOSa0C9HxmKbkLG9ZyQLoavZ1SeSSqDA+QUrg/PtwzuKZQeAbiUhG34xu34n9Ix/AAJ3RmO6iTLWLUEY/QyliG4bruOtOqtxiPj+/5hVmPvuq17IJ9y5naoaZ8+2S9vsjRtQlH3A3DbjG33jGvAO8HuijYLfYFu1jdnDe3B9pqnkeB+MP+D81Q0U84hDo6ocY98jmH+8873bAMggMW/DSryzcHhYZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyYB7B6YkUQMxJfOvVYNLC9IIqdR8vARRXip94LIsHw=;
 b=fR0Op+77NlD8mZWYj+nrv+EPF2fc+Dxmu9TP4AdtH3QQMM0PsN5km2M4PJh11LQ4y72UHdvRRJpSPuPMr+sWHJ8yVTj6/rjsxK6cQocq+rQOnMMqCmKmHDafm+VCg9w2np7Cxctvz/QIDl4aNNmwGKjstC+754pP3Hz9/0kXi5ebUyB8urAh9ZgCoAUdgQZYQ58p7NuPmn0vXEHikvB6B4z3GvQbiKzQ00505iFCXd2td/lEBbdQRCek7txXJO3cxTSlyMhze9XNONNJFPT4dOHlAUjvvFcHvOj/VY9PwLLGpTPpMUA3MgHsYlzjsHTOEn1m4MXgkUFKDGTQ0IThtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3445.namprd12.prod.outlook.com (20.178.196.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 19:40:36 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82%5]) with mapi id 15.20.2178.018; Thu, 22 Aug 2019
 19:40:36 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/amdgpu/display: add flag for multi-display mclk
 switching
Thread-Topic: [PATCH 4/4] drm/amdgpu/display: add flag for multi-display mclk
 switching
Thread-Index: AQHVWSAqhcq1GtH50kaDdUY2N7zVr6cHkKyA
Date: Thu, 22 Aug 2019 19:40:36 +0000
Message-ID: <fc06d6b3-4135-3969-c4a0-0dc17eef9d72@amd.com>
References: <20190822193050.3107-1-alexander.deucher@amd.com>
 <20190822193050.3107-5-alexander.deucher@amd.com>
In-Reply-To: <20190822193050.3107-5-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::23) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0998629f-3f3a-4ef7-6be2-08d727389a66
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB3445; 
x-ms-traffictypediagnostic: BYAPR12MB3445:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3445A7E3DE5E6D874C83DA92ECA50@BYAPR12MB3445.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(189003)(305945005)(52116002)(86362001)(31686004)(7736002)(5660300002)(66446008)(6116002)(99286004)(71200400001)(71190400001)(31696002)(66946007)(316002)(3846002)(36756003)(66066001)(64756008)(66556008)(66476007)(14444005)(256004)(6486002)(446003)(2906002)(386003)(6506007)(11346002)(8936002)(81156014)(4326008)(53546011)(81166006)(186003)(53936002)(486006)(110136005)(76176011)(478600001)(229853002)(102836004)(8676002)(2616005)(6246003)(2501003)(26005)(25786009)(14454004)(6436002)(476003)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3445;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QystX0dHYF29/FOvIsMsmg1zoAYvxv6y4GqsSFhpsu9w3+VF5lCZyMi5cZr7XzITVHFhQTNChdr/rV0L0o8XMW4iRJs9BsWn5te8wQsbtgB1/PGBfs12/B9y116+1re2tC24jzlNzwNv3RpUeqy2uQrr5gwZ7HOARodljlHsmkWmbler5+bWxoaCwmdF2gkQupOPfLwPA3vPQvAm1tTMPGbxE16g23/xXu9VtlVxqKV578IkdpmnuRWckipHEZOxxRq3zQxbhKV+GT4m0C5hGi8xm/D3IUdB73MKuDLWt8EMocdCHL+PgKBti9kJrRmE+Hw8yCaz0SkP6H2JaX6N3Un4ZulwDrSWvP3JUs/8aXUxcvJ0YsXu7DnFm5rBRgmtR3Cxvmt4O3cmpBpfaGpXmKcU9a+Qv7pMrifbbW3gDyE=
Content-ID: <84E03D34BE939646B12706969A084407@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0998629f-3f3a-4ef7-6be2-08d727389a66
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 19:40:36.0388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CpJQ7QGAdGWuEb2L9Eobd0+L/s5xuOZycnfizwY1OheUgAhcIOPDYw8pYoLirbK3Ke4y1earwjc2p4CIctaKcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3445
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyYB7B6YkUQMxJfOvVYNLC9IIqdR8vARRXip94LIsHw=;
 b=3/GPkmhlFRm6bchRW4jvpSY05p5ylmG5yhQsTd8VnSPYrQPhB4IDKKa0wAUxVZILgNDZRcmksUo1Xaj8eVXS+d7nGydfzFc4oRSRdtsQW2urBWpnJ7odL5QTUWLIp61rrrqwBiB5qX/Jp0j2rDRHfqUMFO41I6fRgwGNTndZjwo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gOC8yMi8xOSAzOjMwIFBNLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IEFkZCBhIGRjZmVhdHVy
ZW1hc2sgZmxhZyBmb3IgbWNsayBzd2l0Y2hpbmcuICBEaXNhYmxlIGJ5IGRlZmF1bHQ7DQo+IGVu
YWJsZSBvbmNlIHRoZSBmZWF0dXJlIGhhcyBzZWVuIG1vcmUgdGVzdGluZy4NCj4gDQo+IFNldCBh
bWRncHUuZGNmZWF0dXJlbWFzaz0yIG9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIGluIGdydWIN
Cj4gdG8gZW5hYmxlIHRoaXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQoNClBhdGNoZXMgMyBhbmQgNCBhcmUNCg0KUmV2aWV3
ZWQtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4N
Cg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jIHwgMyArKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3Mv
ZGNlX2NhbGNzLmMgIHwgNSArKysrLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kYy5oICAgICAgICAgICAgICAgfCAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNs
dWRlL2FtZF9zaGFyZWQuaCAgICAgICAgICB8IDEgKw0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IGluZGV4IDQ1Mjk4MjY5NzQ0
ZC4uY2I4NmNjZjQ4YmQ5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gQEAgLTY5NCw2ICs2OTQsOSBAQCBzdGF0aWMg
aW50IGFtZGdwdV9kbV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIAlpZiAo
YW1kZ3B1X2RjX2ZlYXR1cmVfbWFzayAmIERDX0ZCQ19NQVNLKQ0KPiAgIAkJaW5pdF9kYXRhLmZs
YWdzLmZiY19zdXBwb3J0ID0gdHJ1ZTsNCj4gICANCj4gKwlpZiAoYW1kZ3B1X2RjX2ZlYXR1cmVf
bWFzayAmIERDX01VTFRJX01PTl9QUF9NQ0xLX1NXSVRDSF9NQVNLKQ0KPiArCQlpbml0X2RhdGEu
ZmxhZ3MubXVsdGlfbW9uX3BwX21jbGtfc3dpdGNoID0gdHJ1ZTsNCj4gKw0KPiAgIAlpbml0X2Rh
dGEuZmxhZ3MucG93ZXJfZG93bl9kaXNwbGF5X29uX2Jvb3QgPSB0cnVlOw0KPiAgIA0KPiAgICNp
ZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYw0KPiBpbmRleCBlY2E2ODFkOWQ3ZjUuLmEx
ZDQ5MjU2ZmFiNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NhbGNzL2RjZV9jYWxjcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jYWxjcy9kY2VfY2FsY3MuYw0KPiBAQCAtMzAyNSw3ICszMDI1LDEwIEBAIGJvb2wgYndfY2Fs
Y3Moc3RydWN0IGRjX2NvbnRleHQgKmN0eCwNCj4gICANCj4gICAJcG9wdWxhdGVfaW5pdGlhbF9k
YXRhKHBpcGUsIHBpcGVfY291bnQsIGRhdGEpOw0KPiAgIA0KPiAtCWNhbGNzX291dHB1dC0+YWxs
X2Rpc3BsYXlzX2luX3N5bmMgPSBhbGxfZGlzcGxheXNfaW5fc3luYyhwaXBlLCBwaXBlX2NvdW50
KTsNCj4gKwlpZiAoY3R4LT5kYy0+Y29uZmlnLm11bHRpX21vbl9wcF9tY2xrX3N3aXRjaCkNCj4g
KwkJY2FsY3Nfb3V0cHV0LT5hbGxfZGlzcGxheXNfaW5fc3luYyA9IGFsbF9kaXNwbGF5c19pbl9z
eW5jKHBpcGUsIHBpcGVfY291bnQpOw0KPiArCWVsc2UNCj4gKwkJY2FsY3Nfb3V0cHV0LT5hbGxf
ZGlzcGxheXNfaW5fc3luYyA9IGZhbHNlOw0KPiAgIA0KPiAgIAlpZiAoZGF0YS0+bnVtYmVyX29m
X2Rpc3BsYXlzICE9IDApIHsNCj4gICAJCXVpbnQ4X3QgeWNsa19sdmwsIHNjbGtfbHZsOw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaA0KPiBpbmRleCAzZWYyNjlmODI0NzguLjVkNGEy
YTkyMjhmMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgNCj4gQEAgLTIy
MCw3ICsyMjAsNyBAQCBzdHJ1Y3QgZGNfY29uZmlnIHsNCj4gICAJYm9vbCBwb3dlcl9kb3duX2Rp
c3BsYXlfb25fYm9vdDsNCj4gICAJYm9vbCBlZHBfbm90X2Nvbm5lY3RlZDsNCj4gICAJYm9vbCBm
b3JjZWRfY2xvY2tzOw0KPiAtDQo+ICsJYm9vbCBtdWx0aV9tb25fcHBfbWNsa19zd2l0Y2g7DQo+
ICAgfTsNCj4gICANCj4gICBlbnVtIHZpc3VhbF9jb25maXJtIHsNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmggYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oDQo+IGluZGV4IGEwYTcyMTE0MzhmMi4uODg4OWFhY2Vl
YzYwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJl
ZC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmgNCj4g
QEAgLTE0Miw2ICsxNDIsNyBAQCBlbnVtIFBQX0ZFQVRVUkVfTUFTSyB7DQo+ICAgDQo+ICAgZW51
bSBEQ19GRUFUVVJFX01BU0sgew0KPiAgIAlEQ19GQkNfTUFTSyA9IDB4MSwNCj4gKwlEQ19NVUxU
SV9NT05fUFBfTUNMS19TV0lUQ0hfTUFTSyA9IDB4MiwNCj4gICB9Ow0KPiAgIA0KPiAgIGVudW0g
YW1kX2RwbV9mb3JjZWRfbGV2ZWw7DQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
