Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B2DC8ED
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 17:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D4389CB3;
	Fri, 18 Oct 2019 15:40:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A51189CB3
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 15:40:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xe4SZE1duJuNFRh094ngsZuHHB8/eW+D5sbQbpOplpQqHRaOYCRfktYOr2vbTcyEo4S1S6Tt5cUcoAghvpG1ywXGedeR8WNLTqK69yX4dyipeOutDqBOkOGNKge4+xf8KisTQqIqbAxDx5WtKITjCnYOg3WwMwTQgRKRL2TWWeK1+dEaTNHIq0vXcrTJzy1HJzFeW6EG7fQTKRH9eb2xpJC2TF0BGjydcEpztL6IrV4ohWa4xLbFx4zX7CNVTSDMj/o7KOSazS9hMgG8HMUH25TO1s/jH6Zxlx6uIa+Smp6efsi05EhVGppvyBWCCRrbvvp/WQymJSUakZ1zeMQSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUFIVVItv5p3Qg1tj+DRQjbFRtkYQo5ZD8xhn8K/hFE=;
 b=UUAkG2WVJXNVkW2jswsBmJwu8jKaLJvtvWGPxvtnrCLYITQS9g7NyDxK51anwUW5dYBB7rx0zc/b67X1kX+rtNW/PhlIWUNrTxTDpKocln8SvM+0pKKf5vDVsTNGRtA0B2BloX9yI6dsnvT63QrBW/hILdp2VgEVq9svcU9/yNr7WPe9u8wRtvLFpFtg4NnDtSPsXxJnTDCbB6UckdhXZOnWk/W3Ts4269EWXaTDUU66ug5hFJqGY0r1w4dBCDnN2+N5TEzMiteveoLQR0mGH6geJUHaPXrkC5bwCEs83VT85DuDN6ZbuUsQOmF4/gmjs7DogagnzhwRJbHhpgiCbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2826.namprd12.prod.outlook.com (20.177.221.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.23; Fri, 18 Oct 2019 15:40:45 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034%4]) with mapi id 15.20.2367.019; Fri, 18 Oct 2019
 15:40:45 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: kfd open return failed if device is locked
Thread-Topic: [PATCH] drm/amdkfd: kfd open return failed if device is locked
Thread-Index: AQHVhcApOQbEtJBw1kOd8JCAgRq7tKdgiU4A
Date: Fri, 18 Oct 2019 15:40:45 +0000
Message-ID: <73684157-12eb-9167-fb19-63e3ad02b16a@amd.com>
References: <20191018142711.19261-1-Philip.Yang@amd.com>
In-Reply-To: <20191018142711.19261-1-Philip.Yang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTOPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::14) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c9a4c25-76b9-4dd2-0e20-08d753e18a6e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2826:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB28268F3720062D53778B6AC8926C0@DM6PR12MB2826.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(199004)(189003)(66066001)(6486002)(2616005)(65806001)(65956001)(256004)(14444005)(11346002)(6436002)(31686004)(446003)(6512007)(52116002)(26005)(81166006)(316002)(76176011)(4001150100001)(31696002)(229853002)(8936002)(81156014)(71190400001)(8676002)(71200400001)(99286004)(110136005)(66476007)(6506007)(66556008)(66446008)(186003)(64756008)(66946007)(478600001)(102836004)(86362001)(305945005)(5660300002)(14454004)(58126008)(2501003)(53546011)(386003)(3846002)(2906002)(476003)(486006)(6116002)(6246003)(7736002)(36756003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2826;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TjGcH2RWTnAuxty4qDGYEYdqjnGXoMFBZjBEXMXqrulx0VvsNVUZmYFbHAvNEqvWcAQtfA6IQVKKIEk5wuljdvftMOOTXv8VuH27F79kwmn9q+VMHzDSUUVzg/W9CW8MtYYKR4nFNrmaeP5MzURw1EFGUfRop71w8R3HHNx/vm8e8VTQTmXMYyZB4oO5L4jolgjysSc4lGU3DwoKFsPeEXpRs9pYLYKQtj+VlIJnEZiHPbq0jZkq0r34q1j7MjIw+3efQ2/Mj/LWlPihMnOCEAomcSeuBSgWfkypTi9/SMvmpP+09XBTyXkA3l+hkrcCisBHashpkfQy6hfGS/coNDvKYKyhz7VIvn1kRUjA1a0tLNTa3RIQJd75Y8BCjEn1Jkf4hFw+/QysZuobufqIvOUi6WVBzbSl8w26IqeKNtA=
Content-ID: <242C9809B207C7438C7FE36A1D7CEBC1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9a4c25-76b9-4dd2-0e20-08d753e18a6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 15:40:45.3418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5lUFBAhho28Jyxov9MbDZThOp4T503GPGvSvKXGsumnQ264Uc6oAsCKOGudy1wOkH7Bbz9wpcLaVvqSX939+ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2826
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUFIVVItv5p3Qg1tj+DRQjbFRtkYQo5ZD8xhn8K/hFE=;
 b=ruklnT9sBDNYaWEMsf3b/7Gokqera+7PD1brl88BBfh9N89U1OIL4qTWTEiZ3B5PeRPKunSt8tsge1j4skkjSxqa72HL0S3EWH+VugQemsudaBZaS9aireZJN7x1JbD1y4NcWPQvqwI9biPGZXWjnhOb1i0tl+31V8OqnfD/0d0=
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

T24gMjAxOS0xMC0xOCAxMDoyNyBhLm0uLCBZYW5nLCBQaGlsaXAgd3JvdGU6DQo+IElmIGRldmlj
ZSBpcyBsb2NrZWQgZm9yIHN1c3BlbmQgYW5kIHJlc3VtZSwga2ZkIG9wZW4gc2hvdWxkIHJldHVy
bg0KPiBmYWlsZWQgLUVBR0FJTiB3aXRob3V0IGNyZWF0aW5nIHByb2Nlc3MsIG90aGVyd2lzZSB0
aGUgYXBwbGljYXRpb24gZXhpdA0KPiB0byByZWxlYXNlIHRoZSBwcm9jZXNzIHdpbGwgaGFuZyB0
byB3YWl0IGZvciByZXN1bWUgaXMgZG9uZSBpZiB0aGUgc3VzcGVuZA0KPiBhbmQgcmVzdW1lIGlz
IHN0dWNrIHNvbWV3aGVyZS4gVGhpcyBpcyBiYWNrdHJhY2U6DQoNClRoaXMgZG9lc24ndCBmaXgg
cHJvY2Vzc2VzIHRoYXQgd2VyZSBjcmVhdGVkIGJlZm9yZSBzdXNwZW5kL3Jlc3VtZSBnb3QgDQpz
dHVjay4gVGhleSB3b3VsZCBzdGlsbCBnZXQgc3R1Y2sgd2l0aCB0aGUgc2FtZSBiYWNrdHJhY2Uu
IFNvIHRoaXMgaXMgDQpqdXQgYSBiYW5kLWFpZC4gVGhlIHJlYWwgdW5kZXJseWluZyBwcm9ibGVt
LCB0aGF0IGlzIG5vdCBnZXR0aW5nIA0KYWRkcmVzc2VkLCBpcyBzdXNwZW5kL3Jlc3VtZSBnZXR0
aW5nIHN0dWNrLg0KDQpBbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KDQpSZWdhcmRzLA0KIMKgIEZl
bGl4DQoNCg0KPg0KPiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSBJTkZPOiB0YXNrIHJvY21p
bmZvOjMwMjQgYmxvY2tlZCBmb3IgbW9yZQ0KPiB0aGFuIDEyMCBzZWNvbmRzLg0KPiBbVGh1IE9j
dCAxNyAxNjo0MzozNyAyMDE5XSAgICAgICBOb3QgdGFpbnRlZA0KPiA1LjAuMC1yYzEta2ZkLWNv
bXB1dGUtcm9jbS1ka21zLW5vLW5waS0xMTMxICMxDQo+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIw
MTldICJlY2hvIDAgPg0KPiAvcHJvYy9zeXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0X3NlY3Mi
IGRpc2FibGVzIHRoaXMgbWVzc2FnZS4NCj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gcm9j
bWluZm8gICAgICAgIEQgICAgMCAgMzAyNCAgIDI5NDcNCj4gMHg4MDAwMDAwMA0KPiBbVGh1IE9j
dCAxNyAxNjo0MzozNyAyMDE5XSBDYWxsIFRyYWNlOg0KPiBbVGh1IE9jdCAxNyAxNjo0MzozNyAy
MDE5XSAgPyBfX3NjaGVkdWxlKzB4M2Q5LzB4OGEwDQo+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIw
MTldICBzY2hlZHVsZSsweDMyLzB4NzANCj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIHNj
aGVkdWxlX3ByZWVtcHRfZGlzYWJsZWQrMHhhLzB4MTANCj4gW1RodSBPY3QgMTcgMTY6NDM6Mzcg
MjAxOV0gIF9fbXV0ZXhfbG9jay5pc3JhLjkrMHgxZTMvMHg0ZTANCj4gW1RodSBPY3QgMTcgMTY6
NDM6MzcgMjAxOV0gID8gX19jYWxsX3NyY3UrMHgyNjQvMHgzYjANCj4gW1RodSBPY3QgMTcgMTY6
NDM6MzcgMjAxOV0gID8gcHJvY2Vzc190ZXJtaW5hdGlvbl9jcHNjaCsweDI0LzB4MmYwDQo+IFth
bWRncHVdDQo+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBwcm9jZXNzX3Rlcm1pbmF0aW9u
X2Nwc2NoKzB4MjQvMHgyZjANCj4gW2FtZGdwdV0NCj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAx
OV0NCj4ga2ZkX3Byb2Nlc3NfZGVxdWV1ZV9mcm9tX2FsbF9kZXZpY2VzKzB4NDIvMHg2MCBbYW1k
Z3B1XQ0KPiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAga2ZkX3Byb2Nlc3Nfbm90aWZpZXJf
cmVsZWFzZSsweDFiZS8weDIyMA0KPiBbYW1kZ3B1XQ0KPiBbVGh1IE9jdCAxNyAxNjo0MzozNyAy
MDE5XSAgX19tbXVfbm90aWZpZXJfcmVsZWFzZSsweDNlLzB4YzANCj4gW1RodSBPY3QgMTcgMTY6
NDM6MzcgMjAxOV0gIGV4aXRfbW1hcCsweDE2MC8weDFhMA0KPiBbVGh1IE9jdCAxNyAxNjo0Mzoz
NyAyMDE5XSAgPyBfX2hhbmRsZV9tbV9mYXVsdCsweGJhMy8weDEyMDANCj4gW1RodSBPY3QgMTcg
MTY6NDM6MzcgMjAxOV0gID8gZXhpdF9yb2J1c3RfbGlzdCsweDVhLzB4MTEwDQo+IFtUaHUgT2N0
IDE3IDE2OjQzOjM3IDIwMTldICBtbXB1dCsweDRhLzB4MTIwDQo+IFtUaHUgT2N0IDE3IDE2OjQz
OjM3IDIwMTldICBkb19leGl0KzB4Mjg0LzB4YjIwDQo+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIw
MTldICA/IGhhbmRsZV9tbV9mYXVsdCsweGZhLzB4MjAwDQo+IFtUaHUgT2N0IDE3IDE2OjQzOjM3
IDIwMTldICBkb19ncm91cF9leGl0KzB4M2EvMHhhMA0KPiBbVGh1IE9jdCAxNyAxNjo0MzozNyAy
MDE5XSAgX194NjRfc3lzX2V4aXRfZ3JvdXArMHgxNC8weDIwDQo+IFtUaHUgT2N0IDE3IDE2OjQz
OjM3IDIwMTldICBkb19zeXNjYWxsXzY0KzB4NGYvMHgxMDANCj4gW1RodSBPY3QgMTcgMTY6NDM6
MzcgMjAxOV0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkNCj4NCj4g
U2lnbmVkLW9mZi1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgfCA2ICsrKy0tLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiBpbmRleCBkOWUzNmRi
ZjEzZDUuLjQwZDc1YzM5ZjA4ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2NoYXJkZXYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfY2hhcmRldi5jDQo+IEBAIC0xMjAsMTMgKzEyMCwxMyBAQCBzdGF0aWMgaW50IGtmZF9vcGVu
KHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlcCkNCj4gICAJCXJldHVybiAt
RVBFUk07DQo+ICAgCX0NCj4gICANCj4gKwlpZiAoa2ZkX2lzX2xvY2tlZCgpKQ0KPiArCQlyZXR1
cm4gLUVBR0FJTjsNCj4gKw0KPiAgIAlwcm9jZXNzID0ga2ZkX2NyZWF0ZV9wcm9jZXNzKGZpbGVw
KTsNCj4gICAJaWYgKElTX0VSUihwcm9jZXNzKSkNCj4gICAJCXJldHVybiBQVFJfRVJSKHByb2Nl
c3MpOw0KPiAgIA0KPiAtCWlmIChrZmRfaXNfbG9ja2VkKCkpDQo+IC0JCXJldHVybiAtRUFHQUlO
Ow0KPiAtDQo+ICAgCWRldl9kYmcoa2ZkX2RldmljZSwgInByb2Nlc3MgJWQgb3BlbmVkLCBjb21w
YXQgbW9kZSAoMzIgYml0KSAtICVkXG4iLA0KPiAgIAkJcHJvY2Vzcy0+cGFzaWQsIHByb2Nlc3Mt
PmlzXzMyYml0X3VzZXJfbW9kZSk7DQo+ICAgDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
