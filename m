Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B66E12B247
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Dec 2019 08:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC40489D42;
	Fri, 27 Dec 2019 07:13:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DDF89D42
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Dec 2019 07:13:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMYawnydk7AI2ppI86aC/eqVMP01P8YAZIQROF4OznNsft5BQu3Pjgupt84ZreURno9UHsUTB0yCrRrnZKC1O2dw03Cf0Cknrd9pJ89sf/XaIG6QoaJXsAh/CfkQAEeJNgGZaRGEePIivG5cnDl2uqG1ALkSZj960CH5uu62PZ9PjdwPuqH0t2r+B344pggDYtahNcNONgbHKJYZzqcQKOa1LjkKd6e7iToR5xfEPWKnsBbt2k9fkWR5f6KTQm9chcqNMQ12Ytp/2YxYtXB76ioYGyBerG+m3rXZ2LIAYUglhVgkxuDjGpC2ALfDU577Rhrm/QQk/9TVSggROfe4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tSVXGvjLtW8cTZXrQqnDsYkztg6KKfmflP41svhR1s=;
 b=Ut7SMStWvLwrKLs7pcjVeezfRXjLkUCVrAxn8FlYATgRfSVAh5cEIcpIL2cGXecIg2FSzQa8RRAgG4UwPo6zkLEyiAwkPkVZeitdj/KLfe0muUNZu4NHG3r0gLI1zP34Rkvj/H5OkPZ+l4Ki1qOOknyjp7886K/v5Bv3Rws1ZhNcMx4v6DoZmKTiEsK3+2Kv54ybgGE0AzQp+IMIC77r8NmSotDvrFpCXvtHX2aVxdG7gpMbngYXmr6mtaiHFu9JLQ5vuWE0vLZSDE69sZqI1hpUAjYwMlpflPHDSk8YSuPg0XvHhFxPixq1P+l0/ZXaYduIInsHPMmvW+XLUxvctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tSVXGvjLtW8cTZXrQqnDsYkztg6KKfmflP41svhR1s=;
 b=to8TqmsRU51mFerD2sIsZVfbZD2I8ivTVrvnB/qYwsbA1SVwTp1WHf7gTUCqGUC8kYgbLlPGP5YTCQBiM7HcqzW082L3p+rEtb/sTAtGshmvisrQsKM7qZZBHrKlURhZAn551X6hcjBhoFuKjvFE4swUI7asERkUxmTmFPn/LtI=
Received: from CH2PR12MB3672.namprd12.prod.outlook.com (52.132.246.139) by
 CH2PR12MB3944.namprd12.prod.outlook.com (52.132.231.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Fri, 27 Dec 2019 07:13:20 +0000
Received: from CH2PR12MB3672.namprd12.prod.outlook.com
 ([fe80::31df:679e:d23f:3c2b]) by CH2PR12MB3672.namprd12.prod.outlook.com
 ([fe80::31df:679e:d23f:3c2b%4]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 07:13:20 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Wang,
 Kevin(Yang)" <Kevin1.Wang@amd.com>, "Tao, Yintian" <Yintian.Tao@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>, "Min, Frank" <Frank.Min@amd.com>, "Liu,
 Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] amd/amdgpu/sriov enable onevf mode for ARCTURUS VF
Thread-Topic: [PATCH 1/2] amd/amdgpu/sriov enable onevf mode for ARCTURUS VF
Thread-Index: AQHVvILjY/76J6Fubkq2JqpFQ/7eDKfNjYGwgAABe5A=
Date: Fri, 27 Dec 2019 07:13:19 +0000
Message-ID: <CH2PR12MB367263EC1728C696B337924EBB2A0@CH2PR12MB3672.namprd12.prod.outlook.com>
References: <20191227065710.3261-1-Jack.Zhang1@amd.com>
 <CH2PR12MB3672D8C9F4D961F505205481BB2A0@CH2PR12MB3672.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB3672D8C9F4D961F505205481BB2A0@CH2PR12MB3672.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Zhang1@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 79fd7e77-0965-4a81-da2b-08d78a9c40bf
x-ms-traffictypediagnostic: CH2PR12MB3944:|CH2PR12MB3944:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB394446CF528B6E5081392CDDBB2A0@CH2PR12MB3944.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(199004)(13464003)(189003)(110136005)(2940100002)(316002)(8676002)(5660300002)(8936002)(81166006)(478600001)(55016002)(9686003)(66574012)(52536014)(81156014)(86362001)(2906002)(33656002)(64756008)(66446008)(66476007)(19627235002)(186003)(71200400001)(7696005)(66946007)(76116006)(53546011)(26005)(6506007)(66556008)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3944;
 H:CH2PR12MB3672.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4yOH8OKZ26XjVXQM+I1hkJ7PRO2FyN4SxZfTVFKrfkUH7P/Dzo4bbwPbGyQ8j0Raug+kz0huVAmoqszDp0iJwebT0gNDAlfC84dq5ysJG9IdWOi6iA3/hxOfzQS0dIjZALW+i4c6dQuogVTZAnHtTAbCHkBDwwk/oA7+eW1wv+MtMqjvy1dIIFR5r/xBStnAHKG91DWNvKCB1rkCPD4jro8ASReO+iKW0VjJ0IV2Gju3NGmYGjiYOvDsn0L2EDUSX4HzkOChq4fiJDeaoQGv99+WhyvgXYiwYPy65UxH7sLBfDXVHVcei2QMMZPaev3VOW9ov1RASk/q/qCxGDaOrsLm4Ox9IuzhziJMrCDXp944ai8cf7kyZzl7t5OPW+h39Hwq0Tluu4/NhF2e5yANB48L6a3yMvFQNW2j0OGZYkPEZjtYouH31HyPrkYwpZQtCNGvrZ2Mpyof6grN5zZmvKsmm3dyDKj2o/kPZl4UprjvG9g6ndn6uZ9+ihYGuWIwFjWDgTfkNtvlRA5G4uFNAg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fd7e77-0965-4a81-da2b-08d78a9c40bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 07:13:20.0012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dY9iOxfZKIgF7NCrLiZSeEfmsFISye+y2PLgMjmChufkNxROp/thI0ekCta3ohDO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3944
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

SGksIGFsbCwNCg0KSGVyZSBpcyBzb21lIGRlc2NyaXB0aW9uIGFib3V0IHNyaW92IGFuZCBwcF9v
bmVfdmYgbW9kZToNCjEpCWFtZGdwdV9zcmlvdl92ZiAgbWFya3MgaWYgaXQgaXMgc3Jpb3Ygb3Ig
YmFyZS1tZXRhbC4gV2hpbGUgYW1kZ3B1X3NyaW92X2lzX3BwX29uZV92ZiBpcyBhIG1vZGUgb2Yg
c3Jpb3YtIEl0IG1lYW5zIHRoZXJlIGlzIG9ubHkgb25lIFZGICBnZW5lcmF0ZWQgYnkgaG9zdCBk
cml2ZXIuDQoyKQlIb3N0IGFkbWluaXN0cmF0b3IgY2FuIGRldGVybWluZSDigJx2ZiBudW1iZXLi
gJ0gd2hlbiBob3N0IGRyaXZlciBpcyBsb2FkZWQuIElmIHZmX251bSA9MSwgaG9zdCBkcml2ZXIg
d2lsbCBub3RpZnkgZ3Vlc3QgZHJpdmVyICBpdCBpcyB1bmRlciBvbmUgdmYgbW9kZSAtLS0gcHBf
b25lX3ZmIHJldHVybiB0cnVlLiANCglPdGhlcndpc2UsIHBwX29uZV92ZiByZXR1cm4gZmFsc2Uu
IFdpdGhvdXQgdW5sb2FkaW5nIGd1ZXN0IGRyaXZlciBhbmQgaG9zdCBkcml2ZXIsIHZmX251bSBj
YW5ub3QgYmUgY2hhbmdlZC4gU28gaXQgaXMgYSBzdGF0aWMgcHJvY2Vzcy4NCjMpCVVuZGVyICBw
cF9vbmVfdmYgbW9kZSBpbiBzcmlvdiBwbGF0Zm9ybSwgZ3Vlc3QgZHJpdmVyIHdpbGwgZG8gc211
IGh3X2luaXQsIHRoZSBnb2FsIG9mIGl0IGlzIHRvIGxldCBndWVzdCBkcml2ZXIg4oCcdGFsa+KA
nSB3aXRoIHNtdSBieSBzZW5kaW5nIGF1dGhvcml6ZWQgc211IG1lc3NhZ2VzLiBUaGlzIHdpbGwg
aGVscCB1c2VyIG1vZGUgYXBwIHRvIGR1bXAgaW5mbyBsaWtlIGNsa3MsIHRlbXBlcmF0dXJlLCBH
UFUgdXNhZ2XigKYuIA0KCUN1cnJlbnRseSB3ZSBkb27igJl0IHN1cHBvcnQgZ3Vlc3QgZHJpdmVy
IHRvIHdyaXRlIHZhbHVlIHRvIHNtdS4gV2UgY2FuICBvbmx5IHJlYWQgIHNtdSBpbmZvcm1hdGlv
bi4NCglCZXNpZGVzLCBhcyBob3N0IGRyaXZlciBoYXMgYWxyZWFkeSBpbml0aWFsaXplZCBzbXUg
aHcgc3VjaCBhcyBsb2FkaW5nIHNtdSBmaXJtd2FyZSBhbmQgYW5kIHNldCBzb21lIGZlYXR1cmUg
Y29udHJvbCBtb2Rlcywgc29tZSBodyBpbml0IHN0ZXBzIG5lZWQgdG8gc2tpcCBpbiBndWVzdCBk
cml2ZXIsIHN1Y2ggYXMgd3JpdGUgcHB0YWJsZSwgbG9hZCBzbWMgZmlybXdhcmUuDQo0KQlBdCB0
aGUgc2FtZSB0aW1lLCBwcF9vbmVfdmYgbW9kZSBuZWVkIHNtdSBzb21lIGZpcm13YXJlIGNoYW5n
ZXMgdG8gb3BlbiBwZXJtaXNzaW9uIGZvciBjZXJ0YWluIG1lc3NhZ2VzIGluIFZGLg0KDQoNCkIu
Ui4NCkphY2sNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBaaGFuZywgSmFjayAo
SmlhbikgDQpTZW50OiBGcmlkYXksIERlY2VtYmVyIDI3LCAyMDE5IDM6MDAgUE0NClRvOiBGZW5n
LCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxl
eGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsg
V2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+OyBUYW8sIFlpbnRpYW4gPFlp
bnRpYW4uVGFvQGFtZC5jb20+OyBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPjsgTWlu
LCBGcmFuayA8RnJhbmsuTWluQGFtZC5jb20+OyBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+
OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhhbmcsIEphY2sgKEppYW4pIDxKYWNr
LlpoYW5nMUBhbWQuY29tPg0KU3ViamVjdDogUkU6IFtQQVRDSCAxLzJdIGFtZC9hbWRncHUvc3Jp
b3YgZW5hYmxlIG9uZXZmIG1vZGUgZm9yIEFSQ1RVUlVTIFZGDQoNCg0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogSmFjayBaaGFuZyA8SmFjay5aaGFuZzFAYW1kLmNvbT4gDQpT
ZW50OiBGcmlkYXksIERlY2VtYmVyIDI3LCAyMDE5IDI6NTcgUE0NClRvOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFpoYW5nLCBKYWNrIChKaWFuKSA8SmFjay5aaGFuZzFAYW1k
LmNvbT4NClN1YmplY3Q6IFtQQVRDSCAxLzJdIGFtZC9hbWRncHUvc3Jpb3YgZW5hYmxlIG9uZXZm
IG1vZGUgZm9yIEFSQ1RVUlVTIFZGDQoNCkJlZm9yZSwgaW5pdGlhbGl6YXRpb24gb2Ygc211IGlw
IGJsb2NrIHdvdWxkIGJlIHNraXBwZWQgZm9yIHNyaW92IEFTSUNzLiBCdXQgaWYgdGhlcmUncyBv
bmx5IG9uZSBWRiBiZWluZyB1c2VkLCBndWVzdCBkcml2ZXIgc2hvdWxkIGJlIGFibGUgdG8gZHVt
cCBzb21lIEhXIGluZm8gc3VjaCBhcyBjbGtzLCB0ZW1wZXJhdHVyZSxldGMuDQoNClRvIHNvbHZl
IHRoaXMsIG5vdyBhZnRlciBvbmV2ZiBtb2RlIGlzIGVuYWJsZWQsIGhvc3QgZHJpdmVyIHdpbGwg
bm90aWZ5IGd1ZXN0LiBJZiBpdCdzIG9uZXZmIG1vZGUsIGd1ZXN0IHdpbGwgZG8gc211IGh3X2lu
aXQgYW5kIHNraXAgc29tZSBzdGVwcyBpbiBub3JtYWwgc211IGh3X2luaXQgZmxvdyBiZWNhdXNl
IGhvc3QgZHJpdmVyIGhhcyBhbHJlYWR5IGRvbmUgaXQgZm9yIHNtdS4NCg0KV2l0aCB0aGlzIGZp
eCwgZ3Vlc3QgYXBwIGNhbiB0YWxrIHdpdGggc211IGFuZCBkdW1wIGh3IGluZm9ybWF0aW9uIGZy
b20gc211Lg0KDQp2MjogcmVmaW5lIHRoZSBsb2dpYyBmb3IgcG1fZW5hYmxlZC5Ta2lwIGh3X2lu
aXQgYnkgbm90IGNoYW5naW5nIHBtX2VuYWJsZWQuDQoNClNpZ25lZC1vZmYtYnk6IEphY2sgWmhh
bmcgPEphY2suWmhhbmcxQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcHNwLmMgICAgfCAgMyArLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMgICAgICAgICB8ICAzICstDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jIHwgNDUgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQogMyBmaWxlcyBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYw0KaW5kZXggODQ2OTgzNC4uMDgxMzBhNiAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYw0KKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jDQpAQCAtMTQ0OCw3ICsxNDQ4LDgg
QEAgc3RhdGljIGludCBwc3BfbnBfZndfbG9hZChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkNCiAg
ICAgICAgICAgICAgICAgICAgIHx8IHVjb2RlLT51Y29kZV9pZCA9PSBBTURHUFVfVUNPREVfSURf
UkxDX0cNCiAJICAgICAgICAgICAgfHwgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9J
RF9STENfUkVTVE9SRV9MSVNUX0NOVEwNCiAJICAgICAgICAgICAgfHwgdWNvZGUtPnVjb2RlX2lk
ID09IEFNREdQVV9VQ09ERV9JRF9STENfUkVTVE9SRV9MSVNUX0dQTV9NRU0NCi0JICAgICAgICAg
ICAgfHwgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9STENfUkVTVE9SRV9MSVNU
X1NSTV9NRU0pKQ0KKwkgICAgICAgICAgICB8fCB1Y29kZS0+dWNvZGVfaWQgPT0gQU1ER1BVX1VD
T0RFX0lEX1JMQ19SRVNUT1JFX0xJU1RfU1JNX01FTQ0KKwkgICAgICAgICAgICB8fCB1Y29kZS0+
dWNvZGVfaWQgPT0gQU1ER1BVX1VDT0RFX0lEX1NNQykpDQogCQkJLypza2lwIHVjb2RlIGxvYWRp
bmcgaW4gU1JJT1YgVkYgKi8NCiAJCQljb250aW51ZTsNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c29jMTUuYw0KaW5kZXggYjUzZDQwMS4uYTI3MTQ5NiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NvYzE1LmMNCkBAIC04MjcsOCArODI3LDcgQEAgaW50IHNvYzE1X3NldF9pcF9ibG9ja3Moc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQo
YWRldiwgJmRjZV92aXJ0dWFsX2lwX2Jsb2NrKTsNCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tf
YWRkKGFkZXYsICZnZnhfdjlfMF9pcF9ibG9jayk7DQogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2Nr
X2FkZChhZGV2LCAmc2RtYV92NF8wX2lwX2Jsb2NrKTsNCi0JCWlmICghYW1kZ3B1X3NyaW92X3Zm
KGFkZXYpKQ0KLQkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzbXVfdjExXzBf
aXBfYmxvY2spOw0KKwkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNtdV92MTFf
MF9pcF9ibG9jayk7DQogDQogCQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7DQogCQkJaWYg
KGxpa2VseShhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQKSkg
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KaW5kZXggOTM2YzY4
Mi4uNDJjMGE2ZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jDQpAQCAtNTMxLDEwICs1MzEsMTQgQEAgYm9vbCBpc19zdXBwb3J0X3N3X3NtdShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikNCiAJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1ZFR0Ey
MCkNCiAJCXJldHVybiAoYW1kZ3B1X2RwbSA9PSAyKSA/IHRydWUgOiBmYWxzZTsNCiAJZWxzZSBp
ZiAoYWRldi0+YXNpY190eXBlID49IENISVBfQVJDVFVSVVMpIHsNCi0JCWlmIChhbWRncHVfc3Jp
b3ZfdmYoYWRldikpDQotCQkJcmV0dXJuIGZhbHNlOw0KLQkJZWxzZQ0KKwkJaWYgKGFtZGdwdV9z
cmlvdl92ZihhZGV2KSkgew0KKwkJCWlmKGFtZGdwdV9zcmlvdl9pc19wcF9vbmVfdmYoYWRldikp
DQorCQkJCXJldHVybiB0cnVlOw0KKwkJCWVsc2UNCisJCQkJcmV0dXJuIGZhbHNlOw0KKwkJfSBl
bHNlIHsNCiAJCQlyZXR1cm4gdHJ1ZTsNCisJCX0NCiAJfSBlbHNlDQogCQlyZXR1cm4gZmFsc2U7
DQogfQ0KQEAgLTEwNjIsMjAgKzEwNjYsMTkgQEAgc3RhdGljIGludCBzbXVfc21jX3RhYmxlX2h3
X2luaXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQogCX0NCiANCiAJLyogc211X2R1bXBfcHB0
YWJsZShzbXUpOyAqLw0KKwlpZihhbWRncHVfc3Jpb3ZfdmYoYWRldikgJiYgIWFtZGdwdV9zcmlv
dl9pc19wcF9vbmVfdmYoYWRldikpew0KKwkJLyoNCisJCSAqIENvcHkgcHB0YWJsZSBibyBpbiB0
aGUgdnJhbSB0byBzbWMgd2l0aCBTTVUgTVNHcyBzdWNoIGFzDQorCQkgKiBTZXREcml2ZXJEcmFt
QWRkciBhbmQgVHJhbnNmZXJUYWJsZURyYW0yU211Lg0KKwkJICovDQorCQlyZXQgPSBzbXVfd3Jp
dGVfcHB0YWJsZShzbXUpOw0KKwkJaWYgKHJldCkNCisJCQlyZXR1cm4gcmV0Ow0KIA0KLQkvKg0K
LQkgKiBDb3B5IHBwdGFibGUgYm8gaW4gdGhlIHZyYW0gdG8gc21jIHdpdGggU01VIE1TR3Mgc3Vj
aCBhcw0KLQkgKiBTZXREcml2ZXJEcmFtQWRkciBhbmQgVHJhbnNmZXJUYWJsZURyYW0yU211Lg0K
LQkgKi8NCi0JcmV0ID0gc211X3dyaXRlX3BwdGFibGUoc211KTsNCi0JaWYgKHJldCkNCi0JCXJl
dHVybiByZXQ7DQotDQotCS8qIGlzc3VlIFJ1bipCdGMgbXNnICovDQotCXJldCA9IHNtdV9ydW5f
YnRjKHNtdSk7DQotCWlmIChyZXQpDQotCQlyZXR1cm4gcmV0Ow0KLQ0KKwkJLyogaXNzdWUgUnVu
KkJ0YyBtc2cgKi8NCisJCXJldCA9IHNtdV9ydW5fYnRjKHNtdSk7DQorCQlpZiAocmV0KQ0KKwkJ
CXJldHVybiByZXQ7DQogCXJldCA9IHNtdV9mZWF0dXJlX3NldF9hbGxvd2VkX21hc2soc211KTsN
CiAJaWYgKHJldCkNCiAJCXJldHVybiByZXQ7DQpAQCAtMTA4Myw3ICsxMDg2LDcgQEAgc3RhdGlj
IGludCBzbXVfc21jX3RhYmxlX2h3X2luaXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQogCXJl
dCA9IHNtdV9zeXN0ZW1fZmVhdHVyZXNfY29udHJvbChzbXUsIHRydWUpOw0KIAlpZiAocmV0KQ0K
IAkJcmV0dXJuIHJldDsNCi0NCisJfQ0KIAlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfQVJD
VFVSVVMpIHsNCiAJCXJldCA9IHNtdV9ub3RpZnlfZGlzcGxheV9jaGFuZ2Uoc211KTsNCiAJCWlm
IChyZXQpDQpAQCAtMTEzNiw4ICsxMTM5LDkgQEAgc3RhdGljIGludCBzbXVfc21jX3RhYmxlX2h3
X2luaXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQogCS8qDQogCSAqIFNldCBQTVNUQVRVU0xP
RyB0YWJsZSBibyBhZGRyZXNzIHdpdGggU2V0VG9vbHNEcmFtQWRkciBNU0cgZm9yIHRvb2xzLg0K
IAkgKi8NCi0JcmV0ID0gc211X3NldF90b29sX3RhYmxlX2xvY2F0aW9uKHNtdSk7DQotDQorCWlm
KGFtZGdwdV9zcmlvdl92ZihhZGV2KSAmJiAhYW1kZ3B1X3NyaW92X2lzX3BwX29uZV92ZihhZGV2
KSl7DQorCQlyZXQgPSBzbXVfc2V0X3Rvb2xfdGFibGVfbG9jYXRpb24oc211KTsNCisJfQ0KIAlp
ZiAoIXNtdV9pc19kcG1fcnVubmluZyhzbXUpKQ0KIAkJcHJfaW5mbygiZHBtIGhhcyBiZWVuIGRp
c2FibGVkXG4iKTsNCiANCkBAIC0xMjQ5LDYgKzEyNTMsOSBAQCBzdGF0aWMgaW50IHNtdV9od19p
bml0KHZvaWQgKmhhbmRsZSkNCiAJCXNtdV9zZXRfZ2Z4X2NncGcoJmFkZXYtPnNtdSwgdHJ1ZSk7
DQogCX0NCiANCisJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSYmICFhbWRncHVfc3Jpb3ZfaXNf
cHBfb25lX3ZmKGFkZXYpKQ0KKwkJcmV0dXJuIDA7DQorDQogCWlmICghc211LT5wbV9lbmFibGVk
KQ0KIAkJcmV0dXJuIDA7DQogDQotLQ0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4Cg==
