Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14586BB666
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 16:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346F56E921;
	Mon, 23 Sep 2019 14:15:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710066.outbound.protection.outlook.com [40.107.71.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84C66E8E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 14:15:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAQS+xuW45MGSfzFPNjd0i3L8DIrRY/kGk8yZeh342UDZ8mgxKw6OZ7PGQ62p3alWriZ81rEVoOXGkcnNRVtnDuQiDlTdqw86iGl2t7tvu//ZOd5iAdp377+8vC4I6FwA/2wJA3xOjK46CDJSbd9R3t+5SnpPBvb13QhMStey+4ekKCYe9DHLFj23xBEt7TscmqUetJq3xHrBY2/W00R0DhGZMnjxiGUVeyc8OOXAxg9I/Pqv/YipSXO7+rIKgv/qouQ7aOtj8+lfJCEdvOz2su9ph4rwhk1WRX5gfdv0gm2UuNeIvGD3q4Q9/aBbWDLO5meLBAxTIsffEYwIWO27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZnbuG2x8xjM7iA+SuN9zITlGexxelOoXgIeKW5/wA8=;
 b=KanaPC1ZJZMi+LZoQk6/EH7pnHA4fybWDNuEwL10082QhqDL1bLwpSB5wCQKEKcksk4Ik9ovcON+1iCkAYsTKcSpywrW52uSqYRYrnnDVMePzcisYAd4Vf5QXTI86HMekNdbnKFDbLDCTbHaM/ybHkw38bsRIPDFo0aCPDU1csWwLY3UpQX84497HNUdcXx3N/FBt4MJgCc7DM+lf1NkVCC0GaWOZ8F/EHtCiM2aRgwz3hjE05v/A/5x+XIHwM+CFQ9QPkGMuF6IYCTmqcxBv3sGSqisd48ysv68qxq3hEXRq4XOH8A6mre14k1uY4MDo2dygGcz4r6CI1hz0IPwTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3057.namprd12.prod.outlook.com (20.178.209.23) by
 BN8PR12MB2930.namprd12.prod.outlook.com (20.179.66.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Mon, 23 Sep 2019 14:14:58 +0000
Received: from BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::ec3e:8e66:6501:2f48]) by BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::ec3e:8e66:6501:2f48%5]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 14:14:58 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: correct condition check for psp rlc
 autoload
Thread-Topic: [PATCH 2/2] drm/amdgpu: correct condition check for psp rlc
 autoload
Thread-Index: AQHVchMfEFpSVe+JekS3O4+GudVjsKc5SaQAgAAEJZA=
Date: Mon, 23 Sep 2019 14:14:58 +0000
Message-ID: <BN8PR12MB3057E309C2119F8EDB02A3CCF6850@BN8PR12MB3057.namprd12.prod.outlook.com>
References: <1569245443-27318-1-git-send-email-le.ma@amd.com>
 <1569245443-27318-2-git-send-email-le.ma@amd.com>
 <DM5PR12MB1418F78B0374568673ED5EC7FC850@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB1418F78B0374568673ED5EC7FC850@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f99e4b9a-c844-4829-b3c0-08d740306a82
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2930; 
x-ms-traffictypediagnostic: BN8PR12MB2930:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB2930CE03AA34B4EF0BDF03BCF6850@BN8PR12MB2930.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(189003)(199004)(13464003)(966005)(3846002)(6116002)(11346002)(476003)(71190400001)(2906002)(86362001)(446003)(76176011)(81166006)(81156014)(186003)(8676002)(7696005)(2501003)(8936002)(53546011)(99286004)(478600001)(102836004)(14454004)(6506007)(26005)(5660300002)(6246003)(305945005)(7736002)(9686003)(55016002)(6306002)(71200400001)(74316002)(33656002)(110136005)(76116006)(256004)(14444005)(52536014)(486006)(66066001)(229853002)(66946007)(316002)(6436002)(64756008)(66476007)(66556008)(66446008)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2930;
 H:BN8PR12MB3057.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EObxAhQMeIYrvTk8Xv3Vwvx4GBNFUGHakZi8uEUg9DNEtKWxVKGnj144cWsFi+UkWZUyOKcvlZry/g/poI+R++7z7L7u9s8DaadZfKgxPSQ3kDlKjrpyApIHKhOeQPQggTJ3tYpp0wTgJORN8RaNPLPeQvztadrFv4DpVZXo7kuyxjcETtpPEj9xa6Izr87pCL8/t7j4Q/M8PdGP7eJNxUrf5l9PA/61A25pMZzWxRA98ACYKxsHaSPviP/iywiZaKg0RXREPDZdyPfDXvx3gUA/tBIQ1PRtczgdxHe+QLe3w8zAgun0HIA0vxh2XzU3pRf/oKRgAVCfAeQjgd8uCFgXV3kc2ESwRFGg3sdbDWVzaeR1FlQncvY4OctPdFImNMQgrcIcwUNdSB/yU+HQaAI/KL0BI+Ns76wkOqfYqJ0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99e4b9a-c844-4829-b3c0-08d740306a82
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 14:14:58.4193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XWLyEq64kTIMz9/F1buvVlRGFgwi0AktBHNIT+g5LO0aIOuzSkFMS6OmXc9zkzlW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2930
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZnbuG2x8xjM7iA+SuN9zITlGexxelOoXgIeKW5/wA8=;
 b=mLBT40vfs0/HoeRoXn2Q/yUUNHqYxvc/x1ejgaBhpoF1nn8X7gontVhZEA9OWHnAudqBKxLzkLaiVk2Gvotx8JmxAxXo76Wy/AVh6aUTmZZUae7+kcXqo3QMices0ksiE1pB9cV5XdlhZdQ6OzCn4w0ZWE6NBpZs6NIU3MwCcfg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Le.Ma@amd.com; 
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

U29ycnkgdGhhdCBJIG1pc3NlZCB0byBhZGQgUmV2aWV3ZWQtYnkgd2hlbiBwdXNoIHRoaXMgcGF0
Y2guDQoNClJlZ2FyZHMsDQpNYSBMZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4gDQpTZW50OiBNb25kYXks
IFNlcHRlbWJlciAyMywgMjAxOSA5OjU4IFBNDQpUbzogTWEsIExlIDxMZS5NYUBhbWQuY29tPjsg
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBNYSwgTGUgPExlLk1hQGFtZC5jb20+
DQpTdWJqZWN0OiBSRTogW1BBVENIIDIvMl0gZHJtL2FtZGdwdTogY29ycmVjdCBjb25kaXRpb24g
Y2hlY2sgZm9yIHBzcCBybGMgYXV0b2xvYWQNCg0KUGxlYXNlIGhlbHAgdG8gYWRkIHNpbXBsZSBk
ZXNjcmlwdGlvbiBmb3IgYm90aCBwYXRjaGVzLiB3aXRoIHRoYXQgZml4ZWQsDQoNClNlcmllcyBp
cyBSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KDQpS
ZWdhcmRzLA0KSGF3a2luZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1k
LWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IExlIE1hDQpTZW50OiAyMDE55bm0OeaciDIz5pelIDIxOjMxDQpUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCkNjOiBNYSwgTGUgPExlLk1hQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFU
Q0ggMi8yXSBkcm0vYW1kZ3B1OiBjb3JyZWN0IGNvbmRpdGlvbiBjaGVjayBmb3IgcHNwIHJsYyBh
dXRvbG9hZA0KDQpDaGFuZ2UtSWQ6IElhOTFkMGZiNzE3OWY2OTQ0MjE0ZTg5MmYzNzBkN2VmM2Q2
YjdkMzBlDQpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4NCi0tLQ0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyB8IDMgKystDQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BzcC5jDQppbmRleCBkMzU5ZjFkLi4yYWExYWU2IDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jDQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMNCkBAIC0xMDgwLDcgKzEwODAsOCBAQCBzdGF0
aWMgaW50IHBzcF9ucF9md19sb2FkKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQ0KIAkJCXJldHVy
biByZXQ7DQogDQogCQkvKiBTdGFydCBybGMgYXV0b2xvYWQgYWZ0ZXIgcHNwIHJlY2lldmVkIGFs
bCB0aGUgZ2Z4IGZpcm13YXJlICovDQotCQlpZiAodWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9V
Q09ERV9JRF9STENfUkVTVE9SRV9MSVNUX1NSTV9NRU0pIHsNCisJCWlmIChwc3AtPmF1dG9sb2Fk
X3N1cHBvcnRlZCAmJiB1Y29kZS0+dWNvZGVfaWQgPT0NCisJCQlBTURHUFVfVUNPREVfSURfUkxD
X1JFU1RPUkVfTElTVF9TUk1fTUVNKSB7DQogCQkJcmV0ID0gcHNwX3JsY19hdXRvbG9hZChwc3Ap
Ow0KIAkJCWlmIChyZXQpIHsNCiAJCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gc3RhcnQgcmxjIGF1
dG9sb2FkXG4iKTsNCi0tIA0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
