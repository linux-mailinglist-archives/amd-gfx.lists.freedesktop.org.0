Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D1EBE12D
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 17:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C9B6EBE7;
	Wed, 25 Sep 2019 15:22:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770044.outbound.protection.outlook.com [40.107.77.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E476EBE7
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 15:22:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDxMHbCHQAn+Wy9edTxxdfTbdNgBB7n+OBsrvYTyjFsKyrYYzS+mCVysrsL4j5lLxqgpDG9UQaM+dcj74f8+RuXVOPK1xRYx5gZOWdLOcIKGxyidpNpp2sA3/j7slH/qGXMHwxlg6ytHt+VtptN1+xbHlWNNlHA9h3xJEGls1hNYC/DClskdBQ8lkKavH9F3bJuQH/jnA4e3ct9OrznAcor4t1C8oCcy6sEQJqms3WnpsF8HcAkjFYk/KXOKga6LgJ1tInYBBJFs/at61qnEy3SSdk3WBTjyiM+58LN8lccoM4GG52d5fQcWVSx89+XlOTMYto28lIbp3QweDPGpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZurSYkE1txmf+Ya90Lk/CURoFJHdA2yWnbi470hYa0=;
 b=VAftGVVAj+wVJTCu+1nZ79TiSLtST67sNes3ECOP3tNFAE92VV0bPTmzoJ2zTIcaN0jsmZ+fBNl1XwdGe5Fi4QnqM5isPTtH1xModbsmr5aZ615YoiTskwG/lOGzLn4bSXycDV29128Rd/Hj1vtx8uuBU+FIjt+pUrUFyCxiry1KRBcLKsnjSKrEPBabpXus5+UHALSxamvhnygWjSuDkPC3Hwog2S8vvtSYa4G+B3kxN9rU9ynb+b9uagi9K/4Xv6d7zqoN1toNIavSFUN+jKRFnrQoqcwh2Y9iM+eiF7hWQS1GAKzhSvIuApG6kDH6EgwFZ/IkpH20NhV/fiGSTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4329.namprd12.prod.outlook.com (10.141.184.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 15:22:50 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 15:22:50 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
Thread-Topic: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
Thread-Index: AQHVcyVY+HhwweOsFky1b/6VDbMwBac8g+OA
Date: Wed, 25 Sep 2019 15:22:50 +0000
Message-ID: <2b7c9fe9-0849-d3a5-99b4-3203c1b82de2@amd.com>
References: <1569363225-18469-1-git-send-email-shaoyun.liu@amd.com>
In-Reply-To: <1569363225-18469-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::35) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0687f0b3-9a01-455a-16a1-08d741cc3a32
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB4329; 
x-ms-traffictypediagnostic: DM6PR12MB4329:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB432983DE2511687222CA71C692870@DM6PR12MB4329.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:359;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(199004)(189003)(2906002)(2501003)(31686004)(102836004)(14454004)(478600001)(6506007)(386003)(53546011)(186003)(305945005)(71190400001)(25786009)(256004)(65806001)(71200400001)(52116002)(26005)(76176011)(31696002)(86362001)(6116002)(3846002)(66066001)(65956001)(5660300002)(6246003)(8936002)(81166006)(6486002)(81156014)(8676002)(229853002)(486006)(2616005)(7736002)(446003)(476003)(11346002)(316002)(36756003)(6436002)(99286004)(66946007)(110136005)(64756008)(66446008)(58126008)(66556008)(66476007)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4329;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DA4NjCtvx8TfV2TlaVuLlJFWlZ352x8GmsWb+rmawbrY/oWyMD9wzDWNC1uEqLoc9MCTg9UF1khZErbyqJgq2nZlgmQZ3kuKzQYjQ/isu36lvXhjoLDR90KKRDe/B0UqWvN6dQTeUVm3yMNypNnLbW+nZITOyNzvQhSgMK8k+xIuaH7VYeSA7DQPQ7lpUMNj0GSFf516BPkh/5lo0TyxUjGIlzbbqLlzBrvrw9Wk89PSw2I3YVUZSi1Zn/gPAXbzrDWZ9X9TkLeRI6BVkD948vB3uRk38nqQBFjmLX8tcZzB2HoxiDTOF18ioN6KshUkWOx1fgd8hgUlQFSDtNq2NlkLo2/mtr+izvb55V4eE6rgOxyKqdTI8LbNNQbwH785zAWi5SBQGm3wc12F8VcTwdB1eKBt6GCVVr386GrAvoc=
Content-ID: <AFBBDB3C9FD90A4CB89882EF64803015@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0687f0b3-9a01-455a-16a1-08d741cc3a32
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 15:22:50.3468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U3OrWNoegA7IZq0IdPYm6Fzsq5JzyB1yproG5KeJjI9LqpTI2eJUuxh33EHa1Rm+9qjAK5ofqF48pnFebW51oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4329
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZurSYkE1txmf+Ya90Lk/CURoFJHdA2yWnbi470hYa0=;
 b=1JLhheeP/0UHNQUO0OJscOPEaWgrwVoZ7Xganrd7eg4AIkCpnngINMIvlCmgw+I2kN2PMB9KJNFNush6E13lEflsrfE4203fSwUXS6QSyyLrordAAAGP59ZyLXyf3Hc0KWeONV2iXreHCxFeEMEFECruNxZn8LI6Y19bel4GFoY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

WW91J2xsIGFsc28gbmVlZCB0byBhZGQgImNhc2UgQ0hJUF9OQVZJMTI6IiBpbiBhIGJ1bmNoIG9m
IHBsYWNlcy4gR3JlcCANCmZvciAiQ0hJUF9OQVZJMTAiIGFuZCB5b3UnbGwgZmluZCB0aGVtIGFs
bCBwcmV0dHkgcXVpY2tseS4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQpPbiAyMDE5LTA5LTI0
IDY6MTMgcC5tLiwgTGl1LCBTaGFveXVuIHdyb3RlOg0KPiBBZGQgZGV2aWNlIGluZm8gZm9yIGJv
dGggbmF2aTEyIFBGIGFuZCBWRg0KPg0KPiBDaGFuZ2UtSWQ6IElmYjQwMzVlNjVjMTJkMTUzZmMz
MGU1OTNmZTEwOWY5YzdlMDU0MWY0DQo+IFNpZ25lZC1vZmYtYnk6IHNoYW95dW5sIDxzaGFveXVu
LmxpdUBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
ZGV2aWNlLmMgfCAxOSArKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE5
IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Uu
Yw0KPiBpbmRleCBmMzI5YjgyLi5lZGZiYWU1YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2UuYw0KPiBAQCAtMzg3LDYgKzM4NywyNCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGtmZF9kZXZpY2VfaW5mbyBuYXZpMTBfZGV2aWNlX2luZm8gPSB7DQo+ICAgCS5udW1f
c2RtYV9xdWV1ZXNfcGVyX2VuZ2luZSA9IDgsDQo+ICAgfTsNCj4gICANCj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkxMl9kZXZpY2VfaW5mbyA9IHsNCj4gKwkuYXNp
Y19mYW1pbHkgPSBDSElQX05BVkkxMiwNCj4gKwkuYXNpY19uYW1lID0gIm5hdmkxMiIsDQo+ICsJ
Lm1heF9wYXNpZF9iaXRzID0gMTYsDQo+ICsJLm1heF9ub19vZl9ocWQgID0gMjQsDQo+ICsJLmRv
b3JiZWxsX3NpemUgID0gOCwNCj4gKwkuaWhfcmluZ19lbnRyeV9zaXplID0gOCAqIHNpemVvZih1
aW50MzJfdCksDQo+ICsJLmV2ZW50X2ludGVycnVwdF9jbGFzcyA9ICZldmVudF9pbnRlcnJ1cHRf
Y2xhc3NfdjksDQo+ICsJLm51bV9vZl93YXRjaF9wb2ludHMgPSA0LA0KPiArCS5tcWRfc2l6ZV9h
bGlnbmVkID0gTVFEX1NJWkVfQUxJR05FRCwNCj4gKwkubmVlZHNfaW9tbXVfZGV2aWNlID0gZmFs
c2UsDQo+ICsJLnN1cHBvcnRzX2N3c3IgPSB0cnVlLA0KPiArCS5uZWVkc19wY2lfYXRvbWljcyA9
IGZhbHNlLA0KPiArCS5udW1fc2RtYV9lbmdpbmVzID0gMiwNCj4gKwkubnVtX3hnbWlfc2RtYV9l
bmdpbmVzID0gMCwNCj4gKwkubnVtX3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSA4LA0KPiArfTsN
Cj4gKw0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkxNF9kZXZp
Y2VfaW5mbyA9IHsNCj4gICAJLmFzaWNfZmFtaWx5ID0gQ0hJUF9OQVZJMTQsDQo+ICAgCS5hc2lj
X25hbWUgPSAibmF2aTE0IiwNCj4gQEAgLTQyNSw2ICs0NDMsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGtmZF9kZXZpY2VfaW5mbyAqa2ZkX3N1cHBvcnRlZF9kZXZpY2VzW11bMl0gPSB7DQo+ICAg
CVtDSElQX1JFTk9JUl0gPSB7JnJlbm9pcl9kZXZpY2VfaW5mbywgTlVMTH0sDQo+ICAgCVtDSElQ
X0FSQ1RVUlVTXSA9IHsmYXJjdHVydXNfZGV2aWNlX2luZm8sICZhcmN0dXJ1c19kZXZpY2VfaW5m
b30sDQo+ICAgCVtDSElQX05BVkkxMF0gPSB7Jm5hdmkxMF9kZXZpY2VfaW5mbywgTlVMTH0sDQo+
ICsJW0NISVBfTkFWSTEyXSA9IHsmbmF2aTEyX2RldmljZV9pbmZvLCAmbmF2aTEyX2RldmljZV9p
bmZvfSwNCj4gICAJW0NISVBfTkFWSTE0XSA9IHsmbmF2aTE0X2RldmljZV9pbmZvLCBOVUxMfSwN
Cj4gICB9Ow0KPiAgIA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
