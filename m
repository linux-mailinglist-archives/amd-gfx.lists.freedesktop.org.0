Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A59BAF1A
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 10:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1386E6E228;
	Mon, 23 Sep 2019 08:15:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790074.outbound.protection.outlook.com [40.107.79.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7976E228
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 08:15:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRCjMUsh1WWy6DtL+BLEsUTcXjWr290NNZ8xqxuXDWWM3g5wPDCbgoClDRoyOc/46utkdgsOD3u1kMr2AEH/i6BahH8tkz2BZvX5Okpt3EthYwnWVWDuQpRAcyXKXTy/j7jUxNJ7xvPBCqVxM6WPqWGWW5uZnk+/HCp4nF5m9aWJaw6LE5SxNQZrxza4042drRmfbZMFnXBW3yB+BwmqxVk9s4Fd0yuqHQ4usTW3wWs5hr/GV9NF/YCAYmeU8NwoWevjDtN3ayEeJK08WW/aZWrXaoDB+gDc/fdN3y71B6Ur4omFDT4LxxY37U1RddfMM925DXaxplsxNrDJnuhF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKFRQVeLDYvLVmy+/PGqc863qCNUY1g9WbDV9JWtRIE=;
 b=Zdlfzz3U/XQKyNbtHrXZ01tqq4ehz4CF0MNhG1FUeaeqkgMSa869vXMK2rsRHNqww+jGBSmU8LyvkfN9vtHPryef0sDwmh05csXeljumTwBTzaweUlDHaefGY6g/IK+k6aXdnIOhX5RcmmJMW0LfyzJfdAxUp61Kua48RMTTcWO95/Nu5rtw9N4O7kaWdKyeJmNLvffZwELn22mPEg98BrNXo5p5P3++2gvx1myt9meOwlcwDzKNAvl/uazj7nS+VmplHJQw+jQYUjbCpHt4SjEcOMqd8MdkQaHYKfcwGLH2DVJD7eHiwwqb676IBYdkNZLHbVrESowGlqdGt2cVrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 08:15:19 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 08:15:19 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: remove duplicate macro of
 smu_get_uclk_dpm_states
Thread-Topic: [PATCH] drm/amd/powerplay: remove duplicate macro of
 smu_get_uclk_dpm_states
Thread-Index: AQHVceOELP2ZLFsHp0W/X5YJ+4Od16c46eMg
Date: Mon, 23 Sep 2019 08:15:19 +0000
Message-ID: <MN2PR12MB35364D87D01F11D5AB2250DEFB850@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <20190923074954.830-1-kevin1.wang@amd.com>
In-Reply-To: <20190923074954.830-1-kevin1.wang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 965990ab-26b9-4cf6-e446-08d73ffe2c3a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3440EFA30257D65AE6F90547FB850@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:517;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(13464003)(199004)(189003)(33656002)(52536014)(71190400001)(71200400001)(4326008)(66066001)(229853002)(486006)(81156014)(2906002)(3846002)(6116002)(81166006)(26005)(186003)(14454004)(6436002)(256004)(6246003)(476003)(8936002)(11346002)(446003)(76176011)(7696005)(2501003)(9686003)(8676002)(55016002)(99286004)(305945005)(66446008)(54906003)(110136005)(66946007)(66476007)(316002)(64756008)(66556008)(7736002)(76116006)(25786009)(74316002)(53546011)(478600001)(5660300002)(6506007)(102836004)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HrdsAcRYDu0TPkIhiY6uJXQfRTiHRHQfwM5FHSYC2fe+ZUi7g1AOGuSa5gqW6IPxLYXgv++Pz8gVigV8aF72rRi6FGc6rJanLAWdFY4TPj+GZUN8lLskYZveV36ACi2LyC5uFMCMXPT54OwhobRSWWqQOfR1O/QSa3B0BRq4OtvAc2aEuY4yzZmFoexeGJQmHagcs8tPFXfgo8B8LTY4bOm4gKhS7qfbFaPN/tGs6sskub+7A/T40xAl9lNr0anowts6NMzJa7i5FCi5slUIdmNSH1etUkEI7BhoUZ8IQfBAFZd46EPHf5+IiTeeSHivmd+2DKIyaEDUV++X/cVzQiWbs05avFdEnbF9SNZxG6PmqJyu/tU+1dFgLDp0Tgxhs7ISQ9+jBmpRP8XExzlF/+Bb+A6AdGlhi4WCqHlEzNc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965990ab-26b9-4cf6-e446-08d73ffe2c3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 08:15:19.0985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eNVuwVbPftoWOeWV43b0pFls9ZMnYNQoJrDUHZlXOwGeeIdF26TUD7FzvJ4vmsTs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKFRQVeLDYvLVmy+/PGqc863qCNUY1g9WbDV9JWtRIE=;
 b=Bjm9LQc0GWJp3nBgeyOIpeR6Pm1uojZlapurXPCdU6xEKfQOGWhDO9YEUcNrLN1WGPOwQ83M4F1EzxoCTsJf4VgvKpn7/vZvfVI4kCZrmMcSxmWoyzhNwS7sD66HDd45+qKjNkXiOn3IadGcVTHErFvNhI4wDZ3RyoXFR/4vOX8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIGNsZWFuIHVwIHRoZSBkdXBsaWNhdGUgY29kZS4gVGhlIHBhdGNoIGlzIApSZXZpZXdl
ZC1ieTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpUaGFua3MsClByaWtlCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBXYW5nLCBLZXZpbihZYW5nKSA8S2V2
aW4xLldhbmdAYW1kLmNvbT4KPiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAyMywgMjAxOSAzOjUw
IFBNCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IEh1YW5nLCBSYXkg
PFJheS5IdWFuZ0BhbWQuY29tPjsgRmVuZywgS2VubmV0aAo+IDxLZW5uZXRoLkZlbmdAYW1kLmNv
bT47IExpYW5nLCBQcmlrZSA8UHJpa2UuTGlhbmdAYW1kLmNvbT47IFdhbmcsCj4gS2V2aW4oWWFu
ZykgPEtldmluMS5XYW5nQGFtZC5jb20+Cj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL3Bvd2Vy
cGxheTogcmVtb3ZlIGR1cGxpY2F0ZSBtYWNybyBvZgo+IHNtdV9nZXRfdWNsa19kcG1fc3RhdGVz
Cj4gCj4gcmVtb3ZlIGR1cGxpY2F0ZSBtYWNybyBvZiBzbXVfZ2V0X3VjbGtfZHBtX3N0YXRlcwo+
IAo+IGZpeCBjb21taXQ6Cj4gZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCB0aGUgaW50ZXJmYWNlIGZv
ciBnZXR0aW5nIHVsdGltYXRlIGZyZXF1ZW5jeSB2Mwo+IAo+IFNpZ25lZC1vZmYtYnk6IEtldmlu
IFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvYW1kZ3B1X3NtdS5oCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
YW1kZ3B1X3NtdS5oCj4gaW5kZXggNDVkYTIxZGMyMzU2Li41YTAwNTliOWFlYzkgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKPiBAQCAt
NzUyLDggKzc1Miw2IEBAIHN0cnVjdCBzbXVfZnVuY3MKPiAgCSgoc211KS0+cHB0X2Z1bmNzLT5n
ZXRfdWNsa19kcG1fc3RhdGVzID8gKHNtdSktPnBwdF9mdW5jcy0KPiA+Z2V0X3VjbGtfZHBtX3N0
YXRlcygoc211KSwgKGNsb2Nrc19pbl9raHopLCAobnVtX3N0YXRlcykpIDogMCkgICNkZWZpbmUK
PiBzbXVfZ2V0X21heF9zdXN0YWluYWJsZV9jbG9ja3NfYnlfZGMoc211LCBtYXhfY2xvY2tzKSBc
Cj4gIAkoKHNtdSktPmZ1bmNzLT5nZXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2Nrc19ieV9kYyA/IChz
bXUpLT5mdW5jcy0KPiA+Z2V0X21heF9zdXN0YWluYWJsZV9jbG9ja3NfYnlfZGMoKHNtdSksICht
YXhfY2xvY2tzKSkgOiAwKSAtI2RlZmluZQo+IHNtdV9nZXRfdWNsa19kcG1fc3RhdGVzKHNtdSwg
Y2xvY2tzX2luX2toeiwgbnVtX3N0YXRlcykgXAo+IC0JKChzbXUpLT5wcHRfZnVuY3MtPmdldF91
Y2xrX2RwbV9zdGF0ZXMgPyAoc211KS0+cHB0X2Z1bmNzLQo+ID5nZXRfdWNsa19kcG1fc3RhdGVz
KChzbXUpLCAoY2xvY2tzX2luX2toeiksIChudW1fc3RhdGVzKSkgOiAwKQo+ICAjZGVmaW5lIHNt
dV9iYWNvX2lzX3N1cHBvcnQoc211KSBcCj4gIAkoKHNtdSktPmZ1bmNzLT5iYWNvX2lzX3N1cHBv
cnQ/IChzbXUpLT5mdW5jcy0KPiA+YmFjb19pc19zdXBwb3J0KChzbXUpKSA6IGZhbHNlKSAgI2Rl
ZmluZSBzbXVfYmFjb19nZXRfc3RhdGUoc211LCBzdGF0ZSkgXAo+IC0tCj4gMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
