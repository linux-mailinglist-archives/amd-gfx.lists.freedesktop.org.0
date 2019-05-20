Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF2A23352
	for <lists+amd-gfx@lfdr.de>; Mon, 20 May 2019 14:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FA889182;
	Mon, 20 May 2019 12:15:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680078.outbound.protection.outlook.com [40.107.68.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C0B8916F
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 May 2019 12:15:40 +0000 (UTC)
Received: from MN2PR12MB3039.namprd12.prod.outlook.com (20.178.243.144) by
 MN2PR12MB3215.namprd12.prod.outlook.com (20.179.82.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Mon, 20 May 2019 12:15:38 +0000
Received: from MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::74ad:250e:919e:f690]) by MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::74ad:250e:919e:f690%5]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 12:15:38 +0000
From: "Tao, Yintian" <Yintian.Tao@amd.com>
To: "Tao, Yintian" <Yintian.Tao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: no read DF register under SRIOV and set
 correct vram width
Thread-Topic: [PATCH] drm/amdgpu: no read DF register under SRIOV and set
 correct vram width
Thread-Index: AQHVDu1RKjBBcMCI10WIRi3oWLK1/aZz7XyA
Date: Mon, 20 May 2019 12:15:37 +0000
Message-ID: <MN2PR12MB3039FEF0ECDD636EFE5E7BC1E5060@MN2PR12MB3039.namprd12.prod.outlook.com>
References: <1558344031-874-1-git-send-email-yttao@amd.com>
In-Reply-To: <1558344031-874-1-git-send-email-yttao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8daeb1b3-4d0c-4fca-5bd1-08d6dd1cde6d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3215; 
x-ms-traffictypediagnostic: MN2PR12MB3215:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB321503DF4BFCF0276C68CB29E5060@MN2PR12MB3215.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(136003)(39860400002)(396003)(13464003)(199004)(189003)(11346002)(6306002)(446003)(53936002)(2906002)(26005)(316002)(186003)(55016002)(8676002)(81166006)(81156014)(33656002)(8936002)(6246003)(4326008)(7736002)(476003)(305945005)(486006)(71200400001)(256004)(71190400001)(5024004)(14444005)(66946007)(68736007)(229853002)(6436002)(52536014)(66066001)(7696005)(66476007)(66556008)(64756008)(66446008)(73956011)(76116006)(86362001)(6116002)(99286004)(478600001)(3846002)(5660300002)(25786009)(102836004)(6506007)(53546011)(76176011)(110136005)(54906003)(72206003)(74316002)(9686003)(14454004)(2501003)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3215;
 H:MN2PR12MB3039.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x6vmjZfsORLdBHnZxGy//q1R81rV7qflzrCw1sgWHk2xRGogmzNCtI/jXfsDQ/K3YvDR02HQGKeCNBcKO/xJej9zClSjh3xKIGbPHpnf49R5M0V3d3eRt00Xan5FvGIz2ZpSXHm+nCf418/ScBBTLGEswSvOmLnYoPM8ggRpVAImp3oVB1YwVn5eUeOhAxAw+rqkSoWiCY9PIP/T0+r5DfgP9bvsEV8seQfvN8yyZNSnZKAlvLSkAvQFYF/rURtYP0JPfj4ewc9A3UdOz9MpjiM4doYQ1AOXIl/a0Dfus1sQFymKS+VjRf6Nu+/pVzwD3mnInK427GdNc6fsrm/O0xxax/4P1xAMlTc8vksoG6cYyJ3Y0GClhZYqWRIc2o2FIdudB3EyiB9at0MpRSiZnTaF4gnDD97ou5Rw6NRlExQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8daeb1b3-4d0c-4fca-5bd1-08d6dd1cde6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 12:15:37.9006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3215
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnxfWiRznTR3XGbqIIU8RNL+zFR2xE4XUBzrBV8Mahk=;
 b=MWWt+ADX0s0zA+WFV8WARnTNcZQcBrTEp6T9/Oa7z9L6z/SjGaSUoUz/gYKreaaETGcolnDSyWYPysZIZ7yTR0OEDb2ZVgpGyEc7M02W0HRT5jNHmc/A+Qx22pyBQm3mmHepZiSfHmCHQGd2V0ora2NxTo71ZPuq7kxM0JEUM8M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yintian.Tao@amd.com; 
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
Cc: "Liu, Monk" <Monk.Liu@amd.com>, "Huang, Trigger" <Trigger.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGxlYXNlIGlnbm9yZSBpdC4gSSBtaXNzIHRoZSBwYXRjaCB3aGljaCBBbGV4IGF0dGFjaGVkLg0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFlpbnRpYW4gVGFvDQpTZW50
OiBNb25kYXksIE1heSAyMCwgMjAxOSA1OjIxIFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCkNjOiBIdWFuZywgVHJpZ2dlciA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPjsgTGl1
LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPjsgVGFvLCBZaW50aWFuIDxZaW50aWFuLlRhb0BhbWQu
Y29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBubyByZWFkIERGIHJlZ2lzdGVyIHVu
ZGVyIFNSSU9WIGFuZCBzZXQgY29ycmVjdCB2cmFtIHdpZHRoDQoNCltDQVVUSU9OOiBFeHRlcm5h
bCBFbWFpbF0NCg0KUEFSVDE6DQpVbmRlciBTUklPViwgcmVhZGluZyBERiByZWdpc3RlciBoYXMg
Y2hhbmNlIHRvIGxlYWQgdG8gQUVSIGVycm9yIGluIGhvc3Qgc2lkZSwganVzdCBza2lwIHJlYWRp
bmcgaXQuDQpQQVJUMjoNCkZvciBWZWdhMTAgU1ItSU9WLCB2cmFtX3dpZHRoIGNhbid0IGJlIHJl
YWQgZnJvbSBBVE9NIGFzIFJBVkVOLCBhbmQgREYgcmVsYXRlZCByZWdpc3RlcnMgaXMgbm90IHJl
YWRhYmxlLCBzZWVtcyBoYXJkY29yZCBpcyB0aGUgb25seSB3YXkgdG8gc2V0IHRoZSBjb3JyZWN0
IHZyYW1fd2lkdGguDQoNClNpZ25lZC1vZmYtYnk6IFRyaWdnZXIgSHVhbmcgPFRyaWdnZXIuSHVh
bmdAYW1kLmNvbT4NClNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPg0K
U2lnbmVkLW9mZi1ieTogWWludGlhbiBUYW8gPHl0dGFvQGFtZC5jb20+DQotLS0NCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwgOSArKysrKysrKy0NCiAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYw0KaW5kZXggYzIyMTU3MC4uYjViZjllZCAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCkBAIC04MzcsNyArODM3LDcgQEAgc3RhdGljIGludCBn
bWNfdjlfMF9tY19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KDQogICAgICAgIGlm
IChhbWRncHVfZW11X21vZGUgIT0gMSkNCiAgICAgICAgICAgICAgICBhZGV2LT5nbWMudnJhbV93
aWR0aCA9IGFtZGdwdV9hdG9tZmlybXdhcmVfZ2V0X3ZyYW1fd2lkdGgoYWRldik7DQotICAgICAg
IGlmICghYWRldi0+Z21jLnZyYW1fd2lkdGgpIHsNCisgICAgICAgaWYgKCFhZGV2LT5nbWMudnJh
bV93aWR0aCAmJiAhYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7DQogICAgICAgICAgICAgICAgLyog
aGJtIG1lbW9yeSBjaGFubmVsIHNpemUgKi8NCiAgICAgICAgICAgICAgICBpZiAoYWRldi0+Zmxh
Z3MgJiBBTURfSVNfQVBVKQ0KICAgICAgICAgICAgICAgICAgICAgICAgY2hhbnNpemUgPSA2NDsN
CkBAIC04NDgsNiArODQ4LDEzIEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfbWNfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikNCiAgICAgICAgICAgICAgICBhZGV2LT5nbWMudnJhbV93aWR0
aCA9IG51bWNoYW4gKiBjaGFuc2l6ZTsNCiAgICAgICAgfQ0KDQorICAgICAgIC8qIEZvciBWZWdh
MTAgU1ItSU9WLCB2cmFtX3dpZHRoIGNhbid0IGJlIHJlYWQgZnJvbSBBVE9NIGFzIFJBVkVOLA0K
KyAgICAgICAgKiBhbmQgREYgcmVsYXRlZCByZWdpc3RlcnMgaXMgbm90IHJlYWRhYmxlLCBzZWVt
cyBoYXJkY29yZCBpcyB0aGUNCisgICAgICAgICogb25seSB3YXkgdG8gc2V0IHRoZSBjb3JyZWN0
IHZyYW1fd2lkdGggKi8NCisgICAgICAgaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSAmJiAoYWRl
di0+YXNpY190eXBlID09IENISVBfVkVHQTEwKSkgew0KKyAgICAgICAgICAgICAgIGFkZXYtPmdt
Yy52cmFtX3dpZHRoID0gMjA0ODsNCisgICAgICAgfQ0KKw0KICAgICAgICAvKiBzaXplIGluIE1C
IG9uIHNpICovDQogICAgICAgIGFkZXYtPmdtYy5tY192cmFtX3NpemUgPQ0KICAgICAgICAgICAg
ICAgIGFkZXYtPm5iaW9fZnVuY3MtPmdldF9tZW1zaXplKGFkZXYpICogMTAyNFVMTCAqIDEwMjRV
TEw7DQotLQ0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
