Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D686CC86
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 12:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE0D6E397;
	Thu, 18 Jul 2019 10:07:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089456E397
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 10:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InuMfShYc+Q169sRHIs3Q4/b95fhYbURjDGAs/yprOutW4w7v0tVwTLYsciaMQy9Bvdly9QJCZH4fFeEEwzfpzc74eXgY36cS2c7SFGUvfVkfyX951EHy+R1TQgIlpdEdW65jU+M7CB2kTXk1VurCAWiqCm3UNDlf88CZ+DDvoJS/NcFFHgx0fDagPWSE5iiflamk50z3+qY5cG23BxGsYhUd2KKdrL//MeFFHoDvT8B2videMiY3Y1E3iYAPQ5L9pfx0iwKj2CScnYTERMnqmTiZLQAmTda3hy6TlO2+MlSDq0DeevyZVDhTH/scvdF6MJkVogtR/dm6TZOR36c2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGu5nr3195A0pWkBgF0XnxwyByXIBMVP77AV7bsGsvM=;
 b=jj4W3rEb7GUjX90VDZKDf4PgPeCwcHrW3R1YqGbcAn3YdulHJ/id4bF/LCmtrcM/UVV3ns98K3v/XGWtGtECUTErsmmkaWCBSTU5AiWybYPTIVd3KcIclzICWHo+NgiMOD4l9vw/R4g/+xquPDQTU/qxUHTAyAnoRFhUKtCXb68CCwTY7G9p2CHIS0XBzJC/ZrRvwEKCLQs1VAAyYWzvXt2H3f7LjyGxYuOaGNShShhAHKb2sqqADYaaqSgtMCcXlwFysjyYXo0KRIzIjoqqyjNvTw8AsAgAjAV5fNuwjrsNTlT4/rfNd+FdMFBeRvedaDMtYCNOXCqI5p5a6TF8xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4000.namprd12.prod.outlook.com (10.255.239.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 10:07:48 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 10:07:48 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Wang, Kevin(Yang)"
 <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Topic: [PATCH v2] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Index: AQHVPU0zi/IEJ0Yhq0yFgHm+keJTNabQIZSAgAAE08g=
Date: Thu, 18 Jul 2019 10:07:48 +0000
Message-ID: <MN2PR12MB334488835DA1A0FCA28517BAE4C80@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190718094249.22234-1-kevin1.wang@amd.com>,
 <MN2PR12MB3598D6F59B73A6508563CBA38EC80@MN2PR12MB3598.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3598D6F59B73A6508563CBA38EC80@MN2PR12MB3598.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [240e:e0:f002:f8b9:9191:519f:6c9:7c3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f402605-78f2-4e14-850e-08d70b67c999
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4000; 
x-ms-traffictypediagnostic: MN2PR12MB4000:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB4000F97C754022CCEDF76493E4C80@MN2PR12MB4000.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:293;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(189003)(199004)(13464003)(6436002)(81166006)(446003)(81156014)(53936002)(99286004)(46003)(45080400002)(256004)(8676002)(6506007)(2501003)(53546011)(86362001)(8936002)(25786009)(64756008)(236005)(476003)(11346002)(316002)(66946007)(6116002)(76116006)(91956017)(55016002)(66556008)(6306002)(54896002)(68736007)(478600001)(66446008)(9686003)(66476007)(14454004)(186003)(76176011)(54906003)(4326008)(6246003)(2906002)(102836004)(52536014)(33656002)(74316002)(486006)(229853002)(7736002)(606006)(110136005)(7696005)(5660300002)(71200400001)(71190400001)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4000;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /P/stAauzTQo6F0Vk24uTYsR5syGOL2A3RdUFPmDGKir9tvWVMmsofVb0DeCA38pEyiv0oJ1TtuiMQWj/se1VY73hBA1EVgVfPzfqcKWovGOUK5CWGxJcBKdvu3l7x9cGSraU//zTd/3iHPns1h7MbfpAXGlq7f44VYHOXcyXd0UCQ9c11Dl5+q4Edx6zzQxlUKNCPCBAF8IHTiK1DVaRwF5Cz2TrP3/CA8yZNzHgjNOl6zo6P/OWm/4GgE46oIll/5e3fJeBH4Exbu4fJbdZ+0i2jf6OsfPumnYZ3ijOHn1QCfouIOhNMpqSbbfbYkXp2uX+acrMmd3pqoTtaG/T+glFZaEWyw+y7NaFFhCVBQvMoeMNVcPKQf9F+6bumk1CTO0Nt58sOlhOc5ZMwvBkilv8zgPSC3DTn+ndncWHhw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f402605-78f2-4e14-850e-08d70b67c999
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 10:07:48.6393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGu5nr3195A0pWkBgF0XnxwyByXIBMVP77AV7bsGsvM=;
 b=ug+Jkbs0GOqOP2YviLMA2Yk7ReDrVnlRoG4pj0qObcQrjv0O1XErRPy54CXaAxFR6dOWAWiE6mZneuKCpiLKmsPM7yZ5t4p+4l/6SH4Sz2IkUj5sIC8vhwHa/fywg4azn+pPd5dHFEfomFOnLMaWHVxAvTUaN9cLRzYGJJGknfY=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: multipart/mixed; boundary="===============1772752187=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1772752187==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB334488835DA1A0FCA28517BAE4C80MN2PR12MB3344namp_"

--_000_MN2PR12MB334488835DA1A0FCA28517BAE4C80MN2PR12MB3344namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCrvxyKEgT3V0bG9v
ayBmb3IgaU9TPGh0dHBzOi8vYWthLm1zL28wdWtlZj4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQq3orz+yMs6IEZlbmcsIEtlbm5ldGggPEtlbm5ldGguRmVuZ0BhbWQuY29tPg0K
t6LLzcqxvOQ6IFRodXJzZGF5LCBKdWx5IDE4LCAyMDE5IDU6NDk6NTYgUE0NCsrVvP7IyzogV2Fu
ZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZyA8YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQqzrcvNOiBRdWFuLCBF
dmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsg
WHUsIEZlaWZlaSA8RmVpZmVpLlh1QGFtZC5jb20+DQrW98ziOiBSRTogW1BBVENIIHYyXSBkcm0v
YW1kL3Bvd2VycGxheTogY2hhbmdlIHN5c2ZzIHBwX2RwbV94eHggZm9ybWF0IGZvciBuYXZpMTAN
Cg0KUmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogV2FuZywgS2V2aW4oWWFuZykNClNl
bnQ6IFRodXJzZGF5LCBKdWx5IDE4LCAyMDE5IDU6NDMgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KQ2M6IEZlbmcsIEtlbm5ldGggPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsg
UXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1k
LmNvbT47IFh1LCBGZWlmZWkgPEZlaWZlaS5YdUBhbWQuY29tPjsgV2FuZywgS2V2aW4oWWFuZykg
PEtldmluMS5XYW5nQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggdjJdIGRybS9hbWQvcG93ZXJw
bGF5OiBjaGFuZ2Ugc3lzZnMgcHBfZHBtX3h4eCBmb3JtYXQgZm9yIG5hdmkxMA0KDQp2MjoNCnNl
dCBhdmVyYWdlIGNsb2NrIHZhbHVlIG9uIGxldmVsIDEgd2hlbiBjdXJyZW50IGNsb2NrIGVxdWFs
IG1pbiBvciBtYXggY2xvY2sgKGZpbmUgZ3JhaW5lZCBkcG0gc3VwcG9ydCkuDQoNCnRoZSBuYXZp
MTAgZ2Z4Y2xrIChzY2xrKSBzdXBwb3J0IGZpbmUgZ3JhaW5lZCBEUE0sIHNvIHVzZSBsZXZlbCAx
IHRvIHNob3cgY3VycmVudCBkcG0gZnJlcSBpbiBzeXNmcyBwcF9kcG1feHh4DQoNCkNoYW5nZS1J
ZDogSTE0ZGFhNmUzMGM1MmM4OTc5NTcwOGVjMDY2NjA4NjJiYjQ1OTEwMzYNClNpZ25lZC1vZmYt
Ynk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCA0NyArKysrKysrKysrKysrKysrKysrLS0t
DQogMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMNCmluZGV4IDg5NWE0ZTU5
MmQ1YS4uMWY3MjFiODVjMGY2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMNCkBAIC02MjcsMTEgKzYyNywyNiBAQCBzdGF0aWMgaW50IG5hdmkxMF9nZXRf
Y3VycmVudF9jbGtfZnJlcV9ieV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCiAgICAg
ICAgIHJldHVybiByZXQ7DQogfQ0KDQorc3RhdGljIGJvb2wgbmF2aTEwX2lzX3N1cHBvcnRfZmlu
ZV9ncmFpbmVkX2RwbShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCitlbnVtIHNtdV9jbGtfdHlw
ZSBjbGtfdHlwZSkgew0KKyAgICAgICBQUFRhYmxlX3QgKnBwdGFibGUgPSBzbXUtPnNtdV90YWJs
ZS5kcml2ZXJfcHB0YWJsZTsNCisgICAgICAgRHBtRGVzY3JpcHRvcl90ICpkcG1fZGVzYyA9IE5V
TEw7DQorICAgICAgIHVpbnQzMl90IGNsa19pbmRleCA9IDA7DQorDQorICAgICAgIGNsa19pbmRl
eCA9IHNtdV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX3R5cGUpOw0KKyAgICAgICBkcG1fZGVzYyA9
ICZwcHRhYmxlLT5EcG1EZXNjcmlwdG9yW2Nsa19pbmRleF07DQorDQorICAgICAgIC8qIDAgLSBG
aW5lIGdyYWluZWQgRFBNLCAxIC0gRGlzY3JldGUgRFBNICovDQorICAgICAgIHJldHVybiBkcG1f
ZGVzYy0+U25hcFRvRGlzY3JldGUgPT0gMCA/IHRydWUgOiBmYWxzZTsgfQ0KKw0KIHN0YXRpYyBp
bnQgbmF2aTEwX3ByaW50X2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQogICAg
ICAgICAgICAgICAgICAgICAgICAgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsIGNoYXIgKmJ1
ZikgIHsNCiAgICAgICAgIGludCBpLCBzaXplID0gMCwgcmV0ID0gMDsNCiAgICAgICAgIHVpbnQz
Ml90IGN1cl92YWx1ZSA9IDAsIHZhbHVlID0gMCwgY291bnQgPSAwOw0KKyAgICAgICB1aW50MzJf
dCBmcmVxX3ZhbHVlc1szXSA9IHswfTsNCisgICAgICAgdWludDMyX3QgbWFya19pbmRleCA9IDA7
DQoNCiAgICAgICAgIHN3aXRjaCAoY2xrX3R5cGUpIHsNCiAgICAgICAgIGNhc2UgU01VX0dGWENM
SzoNCkBAIC02NDQsMjIgKzY1OSw0MiBAQCBzdGF0aWMgaW50IG5hdmkxMF9wcmludF9jbGtfbGV2
ZWxzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LA0KICAgICAgICAgICAgICAgICByZXQgPSBzbXVf
Z2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBjbGtfdHlwZSwgJmN1cl92YWx1ZSk7DQogICAgICAg
ICAgICAgICAgIGlmIChyZXQpDQogICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHNpemU7
DQorDQogICAgICAgICAgICAgICAgIC8qIDEwS0h6IC0+IE1IeiAqLw0KICAgICAgICAgICAgICAg
ICBjdXJfdmFsdWUgPSBjdXJfdmFsdWUgLyAxMDA7DQoNCi0gICAgICAgICAgICAgICBzaXplICs9
IHNwcmludGYoYnVmLCAiY3VycmVudCBjbGs6ICV1TWh6XG4iLCBjdXJfdmFsdWUpOw0KLQ0KICAg
ICAgICAgICAgICAgICByZXQgPSBzbXVfZ2V0X2RwbV9sZXZlbF9jb3VudChzbXUsIGNsa190eXBl
LCAmY291bnQpOw0KICAgICAgICAgICAgICAgICBpZiAocmV0KQ0KICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiBzaXplOw0KDQotICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IGNv
dW50OyBpKyspIHsNCi0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfZHBtX2Zy
ZXFfYnlfaW5kZXgoc211LCBjbGtfdHlwZSwgaSwgJnZhbHVlKTsNCisgICAgICAgICAgICAgICBp
ZiAoIW5hdmkxMF9pc19zdXBwb3J0X2ZpbmVfZ3JhaW5lZF9kcG0oc211LCBjbGtfdHlwZSkpIHsN
CisgICAgICAgICAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7DQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfYnlf
aW5kZXgoc211LCBjbGtfdHlwZSwgaSwgJnZhbHVlKTsNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKHJldCkNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gc2l6ZTsNCisNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZSAr
PSBzcHJpbnRmKGJ1ZiArIHNpemUsICIlZDogJXVNaHogJXNcbiIsIGksIHZhbHVlLA0KKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3VyX3ZhbHVlID09IHZh
bHVlID8gIioiIDogIiIpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgfQ0KKyAgICAgICAgICAg
ICAgIH0gZWxzZSB7DQorICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBzbXVfZ2V0X2RwbV9m
cmVxX2J5X2luZGV4KHNtdSwgY2xrX3R5cGUsIDAsICZmcmVxX3ZhbHVlc1swXSk7DQorICAgICAg
ICAgICAgICAgICAgICAgICBpZiAocmV0KQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gc2l6ZTsNCisgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfZHBt
X2ZyZXFfYnlfaW5kZXgoc211LCBjbGtfdHlwZSwgY291bnQgLSAxLA0KKyZmcmVxX3ZhbHVlc1sy
XSk7DQogICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCkNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiBzaXplOw0KDQotICAgICAgICAgICAgICAgICAgICAgICBz
aXplICs9IHNwcmludGYoYnVmICsgc2l6ZSwgIiVkOiAldU1oeiAlc1xuIiwgaSwgdmFsdWUsDQot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3VyX3ZhbHVlID09IHZhbHVl
ID8gIioiIDogIiIpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgZnJlcV92YWx1ZXNbMV0gPSBj
dXJfdmFsdWU7DQorICAgICAgICAgICAgICAgICAgICAgICBtYXJrX2luZGV4ID0gY3VyX3ZhbHVl
ID09IGZyZXFfdmFsdWVzWzBdID8gMCA6DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY3VyX3ZhbHVlID09IGZyZXFfdmFsdWVzWzJdID8gMiA6IDE7DQorICAgICAgICAgICAg
ICAgICAgICAgICBpZiAobWFya19pbmRleCAhPSAxKQ0KKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmcmVxX3ZhbHVlc1sxXSA9IChmcmVxX3ZhbHVlc1swXSArIGZyZXFfdmFsdWVzWzJd
KSAvIDI7DQorDQorICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgMzsgaSsr
KSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemUgKz0gc3ByaW50ZihidWYg
KyBzaXplLCAiJWQ6ICV1TWh6ICVzXG4iLCBpLCBmcmVxX3ZhbHVlc1tpXSwNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGkgPT0gbWFya19pbmRleCA/ICIq
IiA6ICIiKTsNCisgICAgICAgICAgICAgICAgICAgICAgIH0NCisNCiAgICAgICAgICAgICAgICAg
fQ0KICAgICAgICAgICAgICAgICBicmVhazsNCiAgICAgICAgIGRlZmF1bHQ6DQotLQ0KMi4yMi4w
DQoNCg==

--_000_MN2PR12MB334488835DA1A0FCA28517BAE4C80MN2PR12MB3344namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div>
<div>
<div style=3D"direction:ltr">reviewed-by: Evan Quan &lt;evan.quan@amd.com&g=
t;</div>
<div style=3D"direction:ltr"></div>
</div>
<div><br>
</div>
<div class=3D"x_ms-outlook-ios-signature">=BB=F1=C8=A1 <a href=3D"https://a=
ka.ms/o0ukef">Outlook for iOS</a></div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Feng,=
 Kenneth &lt;Kenneth.Feng@amd.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> Thursday, July 18, 2019 5:49:56 PM<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; a=
md-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>=B3=AD=CB=CD:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; Huang, Ray &lt;R=
ay.Huang@amd.com&gt;; Xu, Feifei &lt;Feifei.Xu@amd.com&gt;<br>
<b>=D6=F7=CC=E2:</b> RE: [PATCH v2] drm/amd/powerplay: change sysfs pp_dpm_=
xxx format for navi10</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Reviewed-by: Kenneth Feng &lt;kenneth.feng@amd.com=
&gt;<br>
<br>
<br>
<br>
-----Original Message-----<br>
From: Wang, Kevin(Yang) <br>
Sent: Thursday, July 18, 2019 5:43 PM<br>
To: amd-gfx@lists.freedesktop.org<br>
Cc: Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Quan, Evan &lt;Evan.Quan@am=
d.com&gt;; Huang, Ray &lt;Ray.Huang@amd.com&gt;; Xu, Feifei &lt;Feifei.Xu@a=
md.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
Subject: [PATCH v2] drm/amd/powerplay: change sysfs pp_dpm_xxx format for n=
avi10<br>
<br>
v2:<br>
set average clock value on level 1 when current clock equal min or max cloc=
k (fine grained dpm support).<br>
<br>
the navi10 gfxclk (sclk) support fine grained DPM, so use level 1 to show c=
urrent dpm freq in sysfs pp_dpm_xxx<br>
<br>
Change-Id: I14daa6e30c52c89795708ec06660862bb4591036<br>
Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 47 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-=
--<br>
&nbsp;1 file changed, 41 insertions(&#43;), 6 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index 895a4e592d5a..1f721b85c0f6 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -627,11 &#43;627,26 @@ static int navi10_get_current_clk_freq_by_table(s=
truct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static bool navi10_is_support_fine_grained_dpm(struct smu_context *smu=
, <br>
&#43;enum smu_clk_type clk_type) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPTable_t *pptable =3D smu-&gt;sm=
u_table.driver_pptable;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DpmDescriptor_t *dpm_desc =3D NUL=
L;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t clk_index =3D 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clk_index =3D smu_clk_get_index(s=
mu, clk_type);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dpm_desc =3D &amp;pptable-&gt;Dpm=
Descriptor[clk_index];<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 0 - Fine grained DPM, 1 - Disc=
rete DPM */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dpm_desc-&gt;SnapToDiscret=
e =3D=3D 0 ? true : false; }<br>
&#43;<br>
&nbsp;static int navi10_print_clk_levels(struct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum =
smu_clk_type clk_type, char *buf)&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, size =3D 0, ret =3D=
 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t cur_value =3D 0, =
value =3D 0, count =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t freq_values[3] =3D {0};<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t mark_index =3D 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (clk_type) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_GFXCLK:<br>
@@ -644,22 &#43;659,42 @@ static int navi10_print_clk_levels(struct smu_con=
text *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_current_clk_freq(smu, clk_type, &amp;=
cur_value);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n size;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* 10KHz -&gt; MHz */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; cur_value =3D cur_value / 100;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; size &#43;=3D sprintf(buf, &quot;current clk: %uMhz\n&quot;, cur=
_value);<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_dpm_level_count(smu, clk_type, &amp;c=
ount);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n size;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D 0; i &lt; count; i&#43;&#43;) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_=
dpm_freq_by_index(smu, clk_type, i, &amp;value);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!navi10_is_support_fine_grained_dpm(smu, clk_type)) {<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0=
; i &lt; count; i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_dpm_freq_by_index(smu, =
clk_type, i, &amp;value);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; return size;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size &#43;=3D sprintf(buf &#43; size, &=
quot;%d: %uMhz %s\n&quot;, i, value,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cur_value =3D=3D v=
alue ? &quot;*&quot; : &quot;&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; } else {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_=
get_dpm_freq_by_index(smu, clk_type, 0, &amp;freq_values[0]);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return size;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_=
get_dpm_freq_by_index(smu, clk_type, count - 1,
<br>
&#43;&amp;freq_values[2]);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r=
et)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return size;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size &#43;=3D sp=
rintf(buf &#43; size, &quot;%d: %uMhz %s\n&quot;, i, value,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; cur_value =3D=3D value ? &quot;*&quot; : &quot;&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; freq_values[=
1] =3D cur_value;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mark_index =
=3D cur_value =3D=3D freq_values[0] ? 0 :<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cur_value=
 =3D=3D freq_values[2] ? 2 : 1;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (mark_ind=
ex !=3D 1)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; freq_values[1] =3D (freq_values[0] &#43=
; freq_values[2]) / 2;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0=
; i &lt; 3; i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size &#43;=3D sprintf(buf &#43; size, &=
quot;%d: %uMhz %s\n&quot;, i, freq_values[i],<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i =3D=3D mark_inde=
x ? &quot;*&quot; : &quot;&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
--<br>
2.22.0<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_MN2PR12MB334488835DA1A0FCA28517BAE4C80MN2PR12MB3344namp_--

--===============1772752187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1772752187==--
