Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161E32B5E9
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 15:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA24E89FD4;
	Mon, 27 May 2019 13:00:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770040.outbound.protection.outlook.com [40.107.77.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091B289FD4
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 13:00:51 +0000 (UTC)
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB1628.namprd12.prod.outlook.com (10.172.35.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Mon, 27 May 2019 13:00:50 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::d8a6:de7a:d515:a14]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::d8a6:de7a:d515:a14%2]) with mapi id 15.20.1922.021; Mon, 27 May 2019
 13:00:50 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "S, Shirish" <Shirish.S@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Zhang, Jerry" <Jerry.Zhang@amd.com>, "Deng,
 Emily" <Emily.Deng@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix ring test failure issue during s3 in vce
 3.0
Thread-Topic: [PATCH] drm/amdgpu: fix ring test failure issue during s3 in vce
 3.0
Thread-Index: AQHVFF/FxziqBr5pYkiSEO7/JqZY5KZ+76gA
Date: Mon, 27 May 2019 13:00:50 +0000
Message-ID: <c2e96ff1-522f-4d1d-f312-9209a63e58ce@amd.com>
References: <1558942936-16519-1-git-send-email-shirish.s@amd.com>
In-Reply-To: <1558942936-16519-1-git-send-email-shirish.s@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::30) To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7c75605-3e98-457a-bb9d-08d6e2a3579c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1628; 
x-ms-traffictypediagnostic: DM5PR12MB1628:
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR12MB1628F5A209C56688D7A6ECD0E51D0@DM5PR12MB1628.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(376002)(346002)(136003)(39860400002)(199004)(189003)(66946007)(66556008)(316002)(66476007)(386003)(73956011)(53546011)(72206003)(6116002)(66446008)(64756008)(6506007)(3846002)(2906002)(81156014)(81166006)(53936002)(26005)(8936002)(65826007)(8676002)(186003)(31686004)(102836004)(7736002)(6246003)(5660300002)(65806001)(58126008)(68736007)(110136005)(6486002)(54906003)(486006)(478600001)(86362001)(6436002)(64126003)(4326008)(65956001)(66066001)(71190400001)(71200400001)(14454004)(229853002)(256004)(14444005)(52116002)(76176011)(31696002)(99286004)(36756003)(6512007)(54896002)(476003)(2616005)(236005)(6636002)(25786009)(446003)(11346002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1628;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2/FrdviDAnDfVoBApQzGOOMqmtUmx1gLsYqUVa+3nrU9CJ0NmzEDulVDbPhG+G2v5+iVvIhxfyv7HJXvUOXEaDs+KOXiG/Oh/e0MKOyppUBg36FpqJkqAst6SMsJl4Ppzq/wDcfEB96JYBSaTXZ58ChTQw9ABtFxdzU2s4jn2JEDGeMrdqRwOl08Pkqv+3KSxYX3mIkTdV1btFal7LnXVckIWE8HzyvFtdPld7zia5MAfcQQmfEHlWghVT0M3HmthlEM5dNRzBVHhVPjZTBDBVX/xJ40rJJMBGBsrvG6C6IS830J0CesqXQsNN59XK2MqsYVdNpgaKIrLnA3nxgbNbnRGByOeAHl1c5QV85NtSE2pg1fNiXUDR+IvrX3rR4RHrZWgie1MUJj84ToDgSGCxJ6l9cTbp7FVwiwJGFaiDk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c75605-3e98-457a-bb9d-08d6e2a3579c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 13:00:50.0857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoliu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1628
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM9KfQU4mf9SgZ+16GihbVEPKDM/Ft1sa7AgVtQP6qs=;
 b=KKa9Ea1fq0taM7Wr0IQrOfmHwVr99POaCSwE2Sak5BzLu3vpPIIu7lMgxn2VVCWpGo2Boijg/+IbNE31uLnQ2I2zh9eCTo4sF7DOYDxLGcnNjCyCvoTG96JkMaQN4Ey14K13MdMtSRf+GkLfYv36oj6aOfYZY0fueuStHTENUAg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Ching-shih \(Louis\)" <Ching-shih.Li@amd.com>
Content-Type: multipart/mixed; boundary="===============0777774121=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0777774121==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_c2e96ff1522f4d1df3129209a63e58ceamdcom_"

--_000_c2e96ff1522f4d1df3129209a63e58ceamdcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpPbiA1LzI3LzE5IDM6NDIgQU0sIFMsIFNoaXJpc2ggd3JvdGU6DQoNCkZyb206IExvdWlzIExp
IDxDaGluZy1zaGloLkxpQGFtZC5jb20+PG1haWx0bzpDaGluZy1zaGloLkxpQGFtZC5jb20+DQoN
CltXaGF0XQ0KdmNlIHJpbmcgdGVzdCBmYWlscyBjb25zaXN0ZW50bHkgZHVyaW5nIHJlc3VtZSBp
biBzMyBjeWNsZSwgZHVlIHRvDQptaXNtYXRjaCByZWFkICYgd3JpdGUgcG9pbnRlcnMuDQpPbiBk
ZWJ1Zy9hbmFseXNpcyBpdHMgZm91bmQgdGhhdCBycHRyIHRvIGJlIGNvbXBhcmVkIGlzIG5vdCBi
ZWluZw0KY29ycmVjdGx5IHVwZGF0ZWQvcmVhZCwgd2hpY2ggbGVhZHMgdG8gdGhpcyBmYWlsdXJl
Lg0KQmVsb3cgaXMgdGhlIGZhaWx1cmUgc2lnbmF0dXJlOg0KICAgICAgICBbZHJtOmFtZGdwdV92
Y2VfcmluZ190ZXN0X3JpbmddICpFUlJPUiogYW1kZ3B1OiByaW5nIDEyIHRlc3QgZmFpbGVkDQog
ICAgICAgIFtkcm06YW1kZ3B1X2RldmljZV9pcF9yZXN1bWVfcGhhc2UyXSAqRVJST1IqIHJlc3Vt
ZSBvZiBJUCBibG9jayA8dmNlX3YzXzA+IGZhaWxlZCAtMTEwDQogICAgICAgIFtkcm06YW1kZ3B1
X2RldmljZV9yZXN1bWVdICpFUlJPUiogYW1kZ3B1X2RldmljZV9pcF9yZXN1bWUgZmFpbGVkICgt
MTEwKS4NCg0KW0hvd10NCmZldGNoIHJwdHIgYXBwcm9wcmlhdGVseSwgbWVhbmluZyBtb3ZlIGl0
cyByZWFkIGxvY2F0aW9uIGZ1cnRoZXIgZG93bg0KaW4gdGhlIGNvZGUgZmxvdy4NCldpdGggdGhp
cyBwYXRjaCBhcHBsaWVkIHRoZSBzMyBmYWlsdXJlIGlzIG5vIG1vcmUgc2VlbiBmb3IgPjVrIHMz
IGN5Y2xlcywNCndoaWNoIG90aGVyd2lzZSBpcyBwcmV0dHkgY29uc2lzdGVudC4NCg0KU2lnbmVk
LW9mZi1ieTogTG91aXMgTGkgPENoaW5nLXNoaWguTGlAYW1kLmNvbT48bWFpbHRvOkNoaW5nLXNo
aWguTGlAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
Y2UuYyB8IDIgKysNCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMNCmluZGV4IGMwMjFiMTEuLjkyZjlkNDYgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMNCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYw0KQEAgLTEwODQsNiArMTA4
NCw4IEBAIGludCBhbWRncHVfdmNlX3JpbmdfdGVzdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAq
cmluZykNCiAgICAgICAgaWYgKHIpDQogICAgICAgICAgICAgICAgcmV0dXJuIHI7DQoNCisgICAg
ICAgcnB0ciA9IGFtZGdwdV9yaW5nX2dldF9ycHRyKHJpbmcpOw0KKw0KDQpUaGUgcnB0ciB1cGRh
dGUgaXMgdGhlcmU6DQoNCiAgICAgICAgdWludDMyX3QgcnB0ciA9IGFtZGdwdV9yaW5nX2dldF9y
cHRyKHJpbmcpOw0KDQpBcmUgeW91IHN1cmUgdGhpcyBpcyB0aGUgcm9vdCBjYXVzZT8NCg0KUmVn
YXJkcywNCkxlbw0KDQoNCg0KDQoNCiAgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgVkNF
X0NNRF9FTkQpOw0KICAgICAgICBhbWRncHVfcmluZ19jb21taXQocmluZyk7DQoNCg0K

--_000_c2e96ff1522f4d1df3129209a63e58ceamdcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <A812ACDB940DBD4B95D982A02C14E62C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KPHA+PGJyPg0KPC9wPg0KPGRpdiBjbGFzcz0ibW96LWNpdGUt
cHJlZml4Ij5PbiA1LzI3LzE5IDM6NDIgQU0sIFMsIFNoaXJpc2ggd3JvdGU6PGJyPg0KPC9kaXY+
DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjaXRlPSJtaWQ6MTU1ODk0MjkzNi0xNjUxOS0xLWdp
dC1zZW5kLWVtYWlsLXNoaXJpc2guc0BhbWQuY29tIj4NCjxwcmUgY2xhc3M9Im1vei1xdW90ZS1w
cmUiIHdyYXA9IiI+RnJvbTogTG91aXMgTGkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOkNoaW5nLXNoaWguTGlAYW1kLmNvbSI+Jmx0O0NoaW5nLXNoaWguTGlA
YW1kLmNvbSZndDs8L2E+DQoNCltXaGF0XQ0KdmNlIHJpbmcgdGVzdCBmYWlscyBjb25zaXN0ZW50
bHkgZHVyaW5nIHJlc3VtZSBpbiBzMyBjeWNsZSwgZHVlIHRvDQptaXNtYXRjaCByZWFkICZhbXA7
IHdyaXRlIHBvaW50ZXJzLg0KT24gZGVidWcvYW5hbHlzaXMgaXRzIGZvdW5kIHRoYXQgcnB0ciB0
byBiZSBjb21wYXJlZCBpcyBub3QgYmVpbmcNCmNvcnJlY3RseSB1cGRhdGVkL3JlYWQsIHdoaWNo
IGxlYWRzIHRvIHRoaXMgZmFpbHVyZS4NCkJlbG93IGlzIHRoZSBmYWlsdXJlIHNpZ25hdHVyZToN
CglbZHJtOmFtZGdwdV92Y2VfcmluZ190ZXN0X3JpbmddICpFUlJPUiogYW1kZ3B1OiByaW5nIDEy
IHRlc3QgZmFpbGVkDQoJW2RybTphbWRncHVfZGV2aWNlX2lwX3Jlc3VtZV9waGFzZTJdICpFUlJP
UiogcmVzdW1lIG9mIElQIGJsb2NrICZsdDt2Y2VfdjNfMCZndDsgZmFpbGVkIC0xMTANCglbZHJt
OmFtZGdwdV9kZXZpY2VfcmVzdW1lXSAqRVJST1IqIGFtZGdwdV9kZXZpY2VfaXBfcmVzdW1lIGZh
aWxlZCAoLTExMCkuDQoNCltIb3ddDQpmZXRjaCBycHRyIGFwcHJvcHJpYXRlbHksIG1lYW5pbmcg
bW92ZSBpdHMgcmVhZCBsb2NhdGlvbiBmdXJ0aGVyIGRvd24NCmluIHRoZSBjb2RlIGZsb3cuDQpX
aXRoIHRoaXMgcGF0Y2ggYXBwbGllZCB0aGUgczMgZmFpbHVyZSBpcyBubyBtb3JlIHNlZW4gZm9y
ICZndDs1ayBzMyBjeWNsZXMsDQp3aGljaCBvdGhlcndpc2UgaXMgcHJldHR5IGNvbnNpc3RlbnQu
DQoNClNpZ25lZC1vZmYtYnk6IExvdWlzIExpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5
NkUiIGhyZWY9Im1haWx0bzpDaGluZy1zaGloLkxpQGFtZC5jb20iPiZsdDtDaGluZy1zaGloLkxp
QGFtZC5jb20mZ3Q7PC9hPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZjZS5jIHwgMiAmIzQzOyYjNDM7DQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygmIzQz
OykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYw0KaW5kZXggYzAyMWIx
MS4uOTJmOWQ0NiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92Y2UuYw0KJiM0MzsmIzQzOyYjNDM7IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZjZS5jDQpAQCAtMTA4NCw2ICYjNDM7MTA4NCw4IEBAIGludCBhbWRncHVfdmNlX3Jpbmdf
dGVzdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykNCiAJaWYgKHIpDQogCQlyZXR1cm4g
cjsNCiANCiYjNDM7CXJwdHIgPSBhbWRncHVfcmluZ19nZXRfcnB0cihyaW5nKTsNCiYjNDM7PC9w
cmU+DQo8L2Jsb2NrcXVvdGU+DQo8cD5UaGUgcnB0ciB1cGRhdGUgaXMgdGhlcmU6PGJyPg0KPC9w
Pg0KPHByZT48Y29kZT4JdWludDMyX3QgcnB0ciA9IGFtZGdwdV9yaW5nX2dldF9ycHRyKHJpbmcp
Ow0KDQpBcmUgeW91IHN1cmUgdGhpcyBpcyB0aGUgcm9vdCBjYXVzZT8NCg0KUmVnYXJkcywNCkxl
bw0KDQo8L2NvZGU+PC9wcmU+DQo8cD48YnI+DQo8L3A+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRl
IiBjaXRlPSJtaWQ6MTU1ODk0MjkzNi0xNjUxOS0xLWdpdC1zZW5kLWVtYWlsLXNoaXJpc2guc0Bh
bWQuY29tIj4NCjxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+DQogCWFtZGdwdV9y
aW5nX3dyaXRlKHJpbmcsIFZDRV9DTURfRU5EKTsNCiAJYW1kZ3B1X3JpbmdfY29tbWl0KHJpbmcp
Ow0KIA0KPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_c2e96ff1522f4d1df3129209a63e58ceamdcom_--

--===============0777774121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0777774121==--
