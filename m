Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A92BBFE2
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 04:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8E5894EA;
	Tue, 24 Sep 2019 02:09:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710054.outbound.protection.outlook.com [40.107.71.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56775894EA
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 02:09:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBFnUQHZqJ4BBxNMYMBInSeZmyUoh44MB3us173kZcMMqkcevF01JrdfoTUBPJEFM8HkDE23neMmpcjzJZoJUUGYfGFMMuTT1m6pcx4jID79dJsp4yOhy/9XQDU+MLeJr0TiltytyQCgws8InnmGGHHVypE0oAysa1JBXJSK6yxPx4ICczPGNHCzRc7QJy+UqbNckspziEbt+Y0N/S7P2ykMqi9rHRGV3q0CPU7V3TXDjol9CQKYh5osty2//TuIpTg4vlz3dubrgwlHNN9KB5F7pfBRe9nH2fPt6JRGaUMIQPrLbNLT2XWsl/46SciN+YFjtkFp09IeJ1SAUdepsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4m/X+qB9OvG1gshjSTUa4E/PqKivwoGR+vjssm1Csk=;
 b=OG/vwIuOcb308OVU+6E7W1vEeevCYSwh22zumNKSmdCOkbA8C48xcVg8jdzWOQ+i20gYhKw+z7dSCxMLK5LdsYX3utvr55J/BFZ7nrGcLHBryRrNzMJxZifmKNGtrq/9bIcJJdG8ZM0rfIRIrgf1X8SzdW1wtI63FBbswihK5a1D6gAJXakH8uxfoXPg9uz/Tcmy6lLaiGDALC8qop66EIq9HFEKMKc+cwPXJwvQ49Ml0brZeBM9qH/U+l3s39ekDUbGsO2kMTENaVbSYd1vxylD92m9csWVJtort7Q/5IZzA8wQCkN+cp3ku6rP5iRzgZQNvHRryTVO49q3cSIaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3712.namprd12.prod.outlook.com (10.255.236.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 02:09:53 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 02:09:53 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdgpu/gmc10: do not apply the 'invalidation from
 sdma' workaround for navi12
Thread-Topic: [PATCH 1/2] drm/amdgpu/gmc10: do not apply the 'invalidation
 from sdma' workaround for navi12
Thread-Index: AQHVchbuzvgxiyJrjU6lDBJ5+GFvFKc6E6nA
Date: Tue, 24 Sep 2019 02:09:53 +0000
Message-ID: <MN2PR12MB33445D3B5780A31B2DC45B95E4840@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190923135746.8066-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190923135746.8066-1-xiaojie.yuan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2998f15b-8324-4343-68df-08d740944a0d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3712; 
x-ms-traffictypediagnostic: MN2PR12MB3712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3712A9C3D899DAF87FA5D11BE4840@MN2PR12MB3712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(13464003)(189003)(199004)(76176011)(7696005)(26005)(11346002)(66556008)(256004)(66066001)(316002)(14444005)(86362001)(478600001)(2906002)(305945005)(6506007)(2501003)(14454004)(53546011)(99286004)(25786009)(54906003)(102836004)(110136005)(76116006)(74316002)(7736002)(81156014)(81166006)(52536014)(8936002)(5660300002)(6246003)(486006)(66446008)(6116002)(186003)(66476007)(476003)(9686003)(3846002)(71190400001)(71200400001)(55016002)(4326008)(8676002)(446003)(6436002)(33656002)(229853002)(64756008)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3712;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cZ+D8iQ9vqjRnUR7MZKIJwE5B9W4nTTtGqRj2qu7TgwRvxsdLW2RmtK8MXKZgDreW9/KfJYdZpPKmItSELzLzFElzmmBcGck3Gfg+roRkqe7mpFBPQtCFaKrW2t6c41GgELA5FyxwW7Ro6uYJZS+NpD3N9Gh7w5sK5bBgmofrTZW9Bu+bvU4XpzAHmqUX8JcQ8kFmeP76Yrsmk+cFcDVqp81wCG5Jfv9uyFPhEfrhGyZhP5+oW5N3FkWJS1oqvxqIobSWuK1a+uLxVmOPoFLKc2XeJ7Qq7E4Da8UbTA1z37XrKGVtt+lFso9KQRFzhW5zfUqayeUdqzH41bfYX4c/WqaM5bdQQvwCsBYA2d3jgZoNF/AHwiyz92bdoU+j2kPgtw2YEbHpF6/N8R5sdcuzatKWveopM0YbPLxQLNBE9o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2998f15b-8324-4343-68df-08d740944a0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 02:09:53.5596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xOkR/wN37LcuGHdPS/s589I0XJUunXggayrk3ohciVBl1pluOSuRXJ2ORYaMApBa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4m/X+qB9OvG1gshjSTUa4E/PqKivwoGR+vjssm1Csk=;
 b=xfXgzI81Cd8fRmd2NbXWf+sR2VSfQzczEGVFuDlWoykno0+iIoMQPiq6VYISAoyxJwoXFxAJL855s4NPiWzrjaC14eQkoCMPY3lAA73qfEZNf2FjggFU0R0g5X0Q0H3NUgo2D7ncKHlEsqWtGoG0nqAdIw7QnrrkDFLfSkf1wL0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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

VGhlIHBhdGNoIG1ha2VzIG1lIGEgbGl0dGxlIGNvbmZ1c2luZy4KQWNjb3JkaW5nIHRvIGFzaWMg
dHlwZSBsaXN0LCAKICAgICAgICBDSElQX05BVkkxMCwgICAgLyogMjUgKi8KICAgICAgICBDSElQ
X05BVkkxNCwgICAgLyogMjYgKi8KICAgICAgICBDSElQX05BVkkxMiwgICAgLyogMjcgKi8KICAg
ICAgICBDSElQX0xBU1QsCmJlZm9yZSB0aGUgc2RtYSB3b3JrYXJvdW5kIGFwcGxpZXMgb25seSBm
b3IgTmF2aTEwIGFuZCBOYXZpMTQobm90IE5hdmkxMikuCkhvd2V2ZXIsIGl0IHNlZW1zIHRoaXMg
cGF0Y2ggcmV2ZXJzZSB0aGUgbG9naWNzIHRvdGFsbHkuICBJdCBhcHBsaWVzIHRoZSB3b3JrYXJv
dW5kIG9ubHkgZm9yIE5hdmkxMi4KCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206IFl1
YW4sIFhpYW9qaWUgPFhpYW9qaWUuWXVhbkBhbWQuY29tPiAKU2VudDogTW9uZGF5LCBTZXB0ZW1i
ZXIgMjMsIDIwMTkgOTo1OCBQTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBYaWFvLCBKYWNrIDxKYWNr
LlhpYW9AYW1kLmNvbT47IEZlbmcsIEtlbm5ldGggPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgUXVh
biwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4xLldh
bmdAYW1kLmNvbT47IFl1YW4sIFhpYW9qaWUgPFhpYW9qaWUuWXVhbkBhbWQuY29tPgpTdWJqZWN0
OiBbUEFUQ0ggMS8yXSBkcm0vYW1kZ3B1L2dtYzEwOiBkbyBub3QgYXBwbHkgdGhlICdpbnZhbGlk
YXRpb24gZnJvbSBzZG1hJyB3b3JrYXJvdW5kIGZvciBuYXZpMTIKCndoZW4gZ2Z4b2ZmIGlzIGVu
YWJsZWQsIGFwcGx5aW5nIHRoaXMgd29ya2Fyb3VuZCBtYWtlcyBzZG1hIGhhbmcgd2hpbGUgZW50
ZXJpbmcgZGVza3RvcC4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFu
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgfCAz
ICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKaW5kZXggZWQxYzNiODgzZjZhLi4zODk3
ZTBkMjg4MzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBf
MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCkBAIC0yOTEs
NyArMjkxLDggQEAgc3RhdGljIHZvaWQgZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGIoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCiAKIAlpZiAoIWFkZXYtPm1tYW4uYnVm
ZmVyX2Z1bmNzX2VuYWJsZWQgfHwKIAkgICAgIWFkZXYtPmliX3Bvb2xfcmVhZHkgfHwKLQkgICAg
YWRldi0+YXNpY190eXBlID4gQ0hJUF9OQVZJMTQgfHwKKwkgICAgYWRldi0+YXNpY190eXBlID09
IENISVBfTkFWSTEwIHx8CisJICAgIGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxNCB8fAog
CSAgICBhZGV2LT5pbl9ncHVfcmVzZXQpIHsKIAkJZ21jX3YxMF8wX2ZsdXNoX3ZtX2h1YihhZGV2
LCB2bWlkLCBBTURHUFVfR0ZYSFVCXzAsIDApOwogCQltdXRleF91bmxvY2soJmFkZXYtPm1tYW4u
Z3R0X3dpbmRvd19sb2NrKTsKLS0KMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
