Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8486D165
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 17:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3756E41F;
	Thu, 18 Jul 2019 15:51:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730045.outbound.protection.outlook.com [40.107.73.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA22D6E41F
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 15:51:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Buyng+3JhcZScBvXn/HYalwDuhi+7pRimtfXh/PnqINJSuBntvb8Sf4//Y0CXHobF24+uyW5935lBISj+vFY5ipkaKlFfMZZUGum05xN+sSke4Y8Ejg8bHG43m0t3gPWQNy/LIdBb46mv/XRvAUst0uz7RbLPWz1RD20VllG4sYWbbTPO4hAKQYsWwwMmWGIrj/z+y6RtreNXJAo3RzIVkDSACH5QUZx2qQ9qpUdEFEj8fWDTDctfUtaTRDuXJPpikHxHKleLQOZBtnrwwr6G+Ek1aFZvb0FE3pAYVp7CTEk1/5zYXs3hB+x+buCYzt+o6tbVRUzE+oM7y0fsKIqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6Av4Inf9F/u02Hpjfu5m0QR8Y3coXp38rToWJFL7FQ=;
 b=J9FZ2hLgZDHktDK0sb5ktxPm+ZJpu6oWVGHswNwAvaSkvyESQQWYXRlAsZXsf8VRy7I1xVaNHOxMmO/HKFaM7bUaXKIWMZAxUQ7/9FHg626UdMpSGhbjykBFeVf8iEWZ+MhFVB5/xuHOI55vU/u5ZIUBxE68njZhCfcPeB20jdU3dHI5Zyc/t6v4KGYBvCnNvmDfazAo51Dz+JXRt3Ma46w0eO2jaaqxDIxhW7akxSH+8MzD1XIMdP5yJvueAuet1uDIw6/Y9be3pSGyXOIdmVKM+DbD4RjC7oeM4j5y5uBxSEfqrYnLOuV7AiUjXAuJcD77sK9HEc3s2oS/h/xCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3471.namprd12.prod.outlook.com (20.178.242.11) by
 MN2PR12MB2879.namprd12.prod.outlook.com (20.179.80.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 15:51:29 +0000
Received: from MN2PR12MB3471.namprd12.prod.outlook.com
 ([fe80::c1f4:f02a:f558:3f3a]) by MN2PR12MB3471.namprd12.prod.outlook.com
 ([fe80::c1f4:f02a:f558:3f3a%7]) with mapi id 15.20.2052.020; Thu, 18 Jul 2019
 15:51:29 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 87/87] drm/amd/display: Force uclk to max for every state
Thread-Topic: [PATCH 87/87] drm/amd/display: Force uclk to max for every state
Thread-Index: AQHVO1NoKNH2EpiwlEC1yoC2AcBVC6bQifFA
Date: Thu, 18 Jul 2019 15:51:29 +0000
Message-ID: <MN2PR12MB3471B471CBA41205293AA6E29EC80@MN2PR12MB3471.namprd12.prod.outlook.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
 <20190715212049.4584-88-sunpeng.li@amd.com>
In-Reply-To: <20190715212049.4584-88-sunpeng.li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 581cb6d4-0157-4124-56b4-08d70b97cc64
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2879; 
x-ms-traffictypediagnostic: MN2PR12MB2879:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB2879FCF4ECB117F354BD38199EC80@MN2PR12MB2879.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(189003)(199004)(13464003)(6306002)(71190400001)(66066001)(71200400001)(6436002)(99286004)(55016002)(66946007)(76116006)(53936002)(14444005)(64756008)(66446008)(66476007)(66556008)(478600001)(33656002)(5660300002)(52536014)(25786009)(3846002)(6116002)(486006)(14454004)(86362001)(229853002)(186003)(966005)(305945005)(7696005)(256004)(74316002)(6506007)(8936002)(8676002)(11346002)(446003)(81156014)(81166006)(76176011)(53546011)(476003)(68736007)(26005)(316002)(6246003)(2501003)(7736002)(54906003)(102836004)(9686003)(110136005)(2906002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2879;
 H:MN2PR12MB3471.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MufRhqzPoPoYRUQOZ6J9Ho38r1d8WzS6IOtVkPJ+YqePDWBk6b29YH/Hi92xtyC1YWiy9h/LRo8eODxCXxQ76TMo8Chw4pHTWzQrvjJXpbEMXKlpSioC3tlTui5VPAIW6Y/rFKz94KQILfnXxWsbtSkW4WUmkhayjyRxxo6Ann3u+TFdrkABKFRStYgN1Hc6vjJGRw/91DuQGRHm/z+9mCF7kYz6EheFgoUyWK1h35VKC46ItA1aTZZSIycUDxidbQMW5vB0IQowkhCP+4GT9R+CHC+pGT8FaEq6Z4NBWeLVsDm06k4TU2tr8cbqy37pJRKyzQY2FQnv/95AbQWsae/h9bG1H1dAIPdoqCKDBTchzJxGFQnrUqfVxoZK3yGUckm7Up5kYDMRMQHxLef1mVN0oie/14085jZXwtOZXlU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581cb6d4-0157-4124-56b4-08d70b97cc64
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:51:29.1820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhanl@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2879
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6Av4Inf9F/u02Hpjfu5m0QR8Y3coXp38rToWJFL7FQ=;
 b=z/2u/CJ4Whtq0Jl65UccMCS55ua/JNA5O4QLUNxq2DSKYUtfMRKnKE72qabRZk8NIQkxp7oS8VphPKWLf5NyAMpByuv7vgSmXeczEhtYGNyDt9gFrDWzGS4pSHsMHFu02lduGD8YXIX6hU+HclNB9sYu85+EzeXXvMaYraxFcZ0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNClJldmlld2VkLWJ5OiBaaGFuIExpdSA8Wmhhbi5MaXVAYW1kLmNvbT4NCg0KDQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBzdW5wZW5nLmxpQGFtZC5jb20NClNl
bnQ6IE1vbmRheSwgSnVseSAxNSwgMjAxOSA1OjIxIFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCkNjOiBMaSwgU3VuIHBlbmcgKExlbykgPFN1bnBlbmcuTGlAYW1kLmNvbT47
IEthemxhdXNrYXMsIE5pY2hvbGFzIDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+DQpTdWJq
ZWN0OiBbUEFUQ0ggODcvODddIGRybS9hbWQvZGlzcGxheTogRm9yY2UgdWNsayB0byBtYXggZm9y
IGV2ZXJ5IHN0YXRlDQoNCkZyb206IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxh
dXNrYXNAYW1kLmNvbT4NCg0KV29ya2Fyb3VuZCBmb3Igbm93IHRvIGF2b2lkIHVuZGVyZmxvdy4N
Cg0KVGhlIHVjbGsgc3dpdGNoIHRpbWUgc2hvdWxkIHJlYWxseSBiZSBidW1wZWQgdXAgdG8gNDA0
LCBidXQgZG9pbmcgc28gd291bGQgZXhwb3NlIHAtc3RhdGUgaGFuZyBpc3N1ZXMgZm9yIGhpZ2hl
ciBiYW5kd2lkdGggZGlzcGxheSBjb25maWd1cmF0aW9ucy4NCg0KQ2hhbmdlLUlkOiBJOTgwNjBm
YzljNGVlZWNlMDdlZjU0ZTEzYTE0NGRlZjg4YTNjM2QyMQ0KU2lnbmVkLW9mZi1ieTogTmljaG9s
YXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0KU2lnbmVkLW9mZi1i
eTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+DQotLS0NCiAuLi4vZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jICAgfCAgNiArKystLS0NCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyAgfCAxMCArKysr
KysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fcHBfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbV9wcF9zbXUuYw0KaW5kZXggOTgzYTFiZDU2MjcyLi43NDY5N2NlZjVkZmUgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bV9wcF9zbXUuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fcHBfc211LmMNCkBAIC05MTIsMTEgKzkxMiwxMSBAQCB2b2lkIGRtX3BwX2dldF9m
dW5jcygNCiAJCS8qIHRvZG8gc2V0X3BtZV93YV9lbmFibGUgY2F1c2UgNGtANm9oeiBkaXNwbGF5
IG5vdCBsaWdodCB1cCAqLw0KIAkJZnVuY3MtPm52X2Z1bmNzLnNldF9wbWVfd2FfZW5hYmxlID0g
TlVMTDsNCiAJCS8qIHRvZG8gZGVidWcgd2FyaW5nIG1lc3NhZ2UgKi8NCi0JCWZ1bmNzLT5udl9m
dW5jcy5zZXRfaGFyZF9taW5fdWNsa19ieV9mcmVxID0gTlVMTDsNCisJCWZ1bmNzLT5udl9mdW5j
cy5zZXRfaGFyZF9taW5fdWNsa19ieV9mcmVxID0gDQorcHBfbnZfc2V0X2hhcmRfbWluX3VjbGtf
YnlfZnJlcTsNCiAJCS8qIHRvZG8gIGNvbXBhcmUgZGF0YSB3aXRoIHdpbmRvdyBkcml2ZXIqLw0K
LQkJZnVuY3MtPm52X2Z1bmNzLmdldF9tYXhpbXVtX3N1c3RhaW5hYmxlX2Nsb2NrcyA9IE5VTEw7
DQorCQlmdW5jcy0+bnZfZnVuY3MuZ2V0X21heGltdW1fc3VzdGFpbmFibGVfY2xvY2tzID0gDQor
cHBfbnZfZ2V0X21heGltdW1fc3VzdGFpbmFibGVfY2xvY2tzOw0KIAkJLyp0b2RvICBjb21wYXJl
IGRhdGEgd2l0aCB3aW5kb3cgZHJpdmVyICovDQotCQlmdW5jcy0+bnZfZnVuY3MuZ2V0X3VjbGtf
ZHBtX3N0YXRlcyA9IE5VTEw7DQorCQlmdW5jcy0+bnZfZnVuY3MuZ2V0X3VjbGtfZHBtX3N0YXRl
cyA9IHBwX252X2dldF91Y2xrX2RwbV9zdGF0ZXM7DQogCQlicmVhazsNCiAjZW5kaWYNCiAJZGVm
YXVsdDoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAv
ZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9yZXNvdXJjZS5jDQppbmRleCAyY2Y3ODhhMzcwNGUuLjQ0NTM3NjUxZjBhMSAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJj
ZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVz
b3VyY2UuYw0KQEAgLTI3MDcsNiArMjcwNyw5IEBAIHN0YXRpYyB2b2lkIGNhcF9zb2NfY2xvY2tz
KA0KIAkJCQkJCSYmIG1heF9jbG9ja3MudUNsb2NrSW5LaHogIT0gMCkNCiAJCQliYi0+Y2xvY2tf
bGltaXRzW2ldLmRyYW1fc3BlZWRfbXRzID0gKG1heF9jbG9ja3MudUNsb2NrSW5LaHogLyAxMDAw
KSAqIDE2Ow0KIA0KKwkJLy8gSEFDSzogRm9yY2UgZXZlcnkgdWNsayB0byBtYXggZm9yIG5vdyB0
byAiZGlzYWJsZSIgdWNsayBzd2l0Y2hpbmcuDQorCQliYi0+Y2xvY2tfbGltaXRzW2ldLmRyYW1f
c3BlZWRfbXRzID0gKG1heF9jbG9ja3MudUNsb2NrSW5LaHogLyAxMDAwKSANCisqIDE2Ow0KKw0K
IAkJaWYgKChiYi0+Y2xvY2tfbGltaXRzW2ldLmZhYnJpY2Nsa19taHogPiAobWF4X2Nsb2Nrcy5m
YWJyaWNDbG9ja0luS2h6IC8gMTAwMCkpDQogCQkJCQkJJiYgbWF4X2Nsb2Nrcy5mYWJyaWNDbG9j
a0luS2h6ICE9IDApDQogCQkJYmItPmNsb2NrX2xpbWl0c1tpXS5mYWJyaWNjbGtfbWh6ID0gKG1h
eF9jbG9ja3MuZmFicmljQ2xvY2tJbktoeiAvIDEwMDApOyBAQCAtMjkyMiw2ICsyOTI1LDggQEAg
c3RhdGljIGJvb2wgaW5pdF9zb2NfYm91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMsDQogCQkJCWxl
MzJfdG9fY3B1KGJiLT52bW1fcGFnZV9zaXplX2J5dGVzKTsNCiAJCWRjbjJfMF9zb2MuZHJhbV9j
bG9ja19jaGFuZ2VfbGF0ZW5jeV91cyA9DQogCQkJCWZpeGVkMTZfdG9fZG91YmxlX3RvX2NwdShi
Yi0+ZHJhbV9jbG9ja19jaGFuZ2VfbGF0ZW5jeV91cyk7DQorCQkvLyBIQUNLISEgTG93ZXIgdWNs
b2NrIGxhdGVuY3kgc3dpdGNoIHRpbWUgc28gd2UgZG9uJ3Qgc3dpdGNoDQorCQlkY24yXzBfc29j
LmRyYW1fY2xvY2tfY2hhbmdlX2xhdGVuY3lfdXMgPSAxMDsNCiAJCWRjbjJfMF9zb2Mud3JpdGVi
YWNrX2RyYW1fY2xvY2tfY2hhbmdlX2xhdGVuY3lfdXMgPQ0KIAkJCQlmaXhlZDE2X3RvX2RvdWJs
ZV90b19jcHUoYmItPndyaXRlYmFja19kcmFtX2Nsb2NrX2NoYW5nZV9sYXRlbmN5X3VzKTsNCiAJ
CWRjbjJfMF9zb2MucmV0dXJuX2J1c193aWR0aF9ieXRlcyA9DQpAQCAtMjk2Myw2ICsyOTY4LDcg
QEAgc3RhdGljIGJvb2wgaW5pdF9zb2NfYm91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMsDQogCQlz
dHJ1Y3QgcHBfc211X252X2Nsb2NrX3RhYmxlIG1heF9jbG9ja3MgPSB7MH07DQogCQl1bnNpZ25l
ZCBpbnQgdWNsa19zdGF0ZXNbOF0gPSB7MH07DQogCQl1bnNpZ25lZCBpbnQgbnVtX3N0YXRlcyA9
IDA7DQorCQlpbnQgaTsNCiAJCWVudW0gcHBfc211X3N0YXR1cyBzdGF0dXM7DQogCQlib29sIGNs
b2NrX2xpbWl0c19hdmFpbGFibGUgPSBmYWxzZTsNCiAJCWJvb2wgdWNsa19zdGF0ZXNfYXZhaWxh
YmxlID0gZmFsc2U7DQpAQCAtMjk4NCw2ICsyOTkwLDEwIEBAIHN0YXRpYyBib29sIGluaXRfc29j
X2JvdW5kaW5nX2JveChzdHJ1Y3QgZGMgKmRjLA0KIAkJCWNsb2NrX2xpbWl0c19hdmFpbGFibGUg
PSAoc3RhdHVzID09IFBQX1NNVV9SRVNVTFRfT0spOw0KIAkJfQ0KIA0KKwkJLy8gSEFDSzogVXNl
IHRoZSBtYXggdWNsa19zdGF0ZXMgdmFsdWUgZm9yIGFsbCBlbGVtZW50cy4NCisJCWZvciAoaSA9
IDA7IGkgPCBudW1fc3RhdGVzOyBpKyspDQorCQkJdWNsa19zdGF0ZXNbaV0gPSB1Y2xrX3N0YXRl
c1tudW1fc3RhdGVzIC0gMV07DQorDQogCQlpZiAoY2xvY2tfbGltaXRzX2F2YWlsYWJsZSAmJiB1
Y2xrX3N0YXRlc19hdmFpbGFibGUgJiYgbnVtX3N0YXRlcykNCiAJCQl1cGRhdGVfYm91bmRpbmdf
Ym94KGRjLCAmZGNuMl8wX3NvYywgJm1heF9jbG9ja3MsIHVjbGtfc3RhdGVzLCBudW1fc3RhdGVz
KTsNCiAJCWVsc2UgaWYgKGNsb2NrX2xpbWl0c19hdmFpbGFibGUpDQotLQ0KMi4yMi4wDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1h
aWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
