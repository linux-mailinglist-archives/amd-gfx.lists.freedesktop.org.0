Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AE1BAF8D
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 10:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3C46E222;
	Mon, 23 Sep 2019 08:30:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680051.outbound.protection.outlook.com [40.107.68.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44336E222
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 08:29:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnTOrs8Wi+WZWTvRQico/q1F4CU5tXDcb+8xCt8IfWFuANS1msnNlhuyTbe2zxS8+34zi8zf94ghtLJCc3MXZm8LGb6KrzYSWV8JwrHgFhhGmwo2lexhTYoXVsGEvwhXix+zM4eqAr5On+RpPJzui36fvk5gcrxZq7YOVnkPBDMxI35K1U23Z2Gck5c0d2WfmCXZye5Gkf7QNpOZ52OuJQPYvf75v5BDXqVpbK1vnDdhvuM5jNBB7ZcSA2byptoc053M5g0xmSjv91T6Ua7SCL6uwUc5aXQ6fzTQ6JoM1PrzNryLDJ/MPITgV0s5uH18wSKbs4L/wHD1nvHOphkJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgzDpJZ0ELy3jIy0bFlTpQC8H8eOMdFQcspQ8TBCtDI=;
 b=OY+FS1Z8550E0La0Wt4vjBQrszTXrXYdl8n4X7Og6mAtyeK4MufPUGnZG1/41i1fXgyighOzNJlXbQ4R0V/uAcL+NKRNg5GlRtQLpW8LNuDUds9rjpoCzkE3pQuipVXkldxE+q53Jn6RrajAlO36etJw0jOEEIhMjfSZv0AMZEBbDDF75H8U+SQiAPTaxoBn0aeCTiY4yBD2INy7qFm0/Ra/ArqSXro2UNfyVEMNcjTI1L4mr24jrOJ64DXg9lTzAQs8wdbKScKeBrtFuDRpb1PFmWy4gkdvLbt69b0+HpkRJety7LUbNZeqLtHrrhch9G00xwTnpCtR+vK/p+OZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3606.namprd12.prod.outlook.com (20.178.197.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 08:29:57 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::e048:cb25:215:2ffa]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::e048:cb25:215:2ffa%6]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 08:29:57 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Ma, Le"
 <Le.Ma@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: libdrm patch merge request
Thread-Topic: libdrm patch merge request
Thread-Index: AdVuBQURfgwadeR7Tfmgj5ATijg5KAAG09vhAB1eddAAS4isgACJJigA
Date: Mon, 23 Sep 2019 08:29:56 +0000
Message-ID: <BYAPR12MB28067959433398F26E3B0507F1850@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <BN8PR12MB305760FE5322B3C6DD2E8DB3F68E0@BN8PR12MB3057.namprd12.prod.outlook.com>
 <BN6PR12MB1809C92D191B63264A83B33BF78E0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <BN8PR12MB30579B6F51F169D42E84DE08F6890@BN8PR12MB3057.namprd12.prod.outlook.com>
 <d9b7c9bd-f3dd-c9c1-c99b-256b1bc979f8@daenzer.net>
In-Reply-To: <d9b7c9bd-f3dd-c9c1-c99b-256b1bc979f8@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76be7c12-815b-4ca0-135e-08d740003789
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3606; 
x-ms-traffictypediagnostic: BYAPR12MB3606:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3606254C04806548826C4EFCF1850@BYAPR12MB3606.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(13464003)(199004)(189003)(6506007)(71200400001)(5660300002)(66946007)(305945005)(66574012)(14444005)(256004)(3480700005)(8676002)(4326008)(4744005)(86362001)(6306002)(3846002)(9686003)(14454004)(6116002)(478600001)(7736002)(966005)(71190400001)(2906002)(6436002)(66476007)(76116006)(33656002)(110136005)(25786009)(26005)(186003)(66556008)(486006)(99286004)(66066001)(11346002)(316002)(55016002)(476003)(74316002)(102836004)(7696005)(76176011)(6246003)(64756008)(66446008)(446003)(81166006)(6636002)(8936002)(52536014)(81156014)(53546011)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3606;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Iyt3+gDDTN7j1dTJrcGIhuvpqxzUaQFajcJ4Q8m0WikkJUKhrzi3nYYhwC3nd4BkQ1DdB/ThDzfCu5uALhebuTQR9+MzCgqtBM6iK17awQqpy9aqRV2GsHiQ6+N/EcKBATpEQf4ILp4hTXncpoM7WycHnySmsRrPVG8X5EfSPFbbv2gSLvFOZ1aznIalyjMVF5tQy/CHS49kVDIg1cS/gvrK7dZdoD8LXo1PVg/cy/epyIBAMcskp9RlS3su0EVDCqhU5+40Zu//L7ebQoPMjyxelZtFfIqCwhqCnIUtjsED3ERN9Qfg7TPfJFS5WES5pg9YpoLX7NY0rxb2oklVyA4SmfHsUnOZRqJi+KxtJg3iAT0NMIdABiV96bDukd1M70+KfyqVeEf6e2oLvg9qoeX11BVQNhPko1qh0UOYofY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76be7c12-815b-4ca0-135e-08d740003789
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 08:29:57.1202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hZPjNpy0+jkoxXQiXnobgn/15hiy6c867ffgkKjKuPkqHXLLEZPANfuPjLC07fHXrxyRyaiP3RMZ5VZID2FQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3606
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgzDpJZ0ELy3jIy0bFlTpQC8H8eOMdFQcspQ8TBCtDI=;
 b=Si5BCkqopqjHvlLwxEpxXlbO/YsLwL8FjG93W1XeRal3FNpZeSmSiJZQd3hM8RQRiDJGy6/RXAX+/S3fUYJ9a5myVn5pPhv/BcwwcpJyTmYbNpb8jTgt5eUMuX6XA0TYZphsPoPO97MXtHsggvdkPiG2mR3ZeeSKQ92lITCNDhA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgTWljaGVsLA0KDQpDYW4geW91IGhlbHAgaWxsdXN0cmF0ZSBtb3JlIGFib3V0IHVzaW5nIE1S
cyB0byBwcm9jZWVkIGxpYmRybSBjaGFuZ2VzPyBXZSBjYW4gdXNlIGdpdGxhYiB0byBtZXJnZSB0
aGUgY2hhbmdlIGZyb20gb3VyIGxvY2FsIGZvcmtlZCByZXBvc2l0b3J5IHRvIGRybSBtYXN0ZXIg
cmVwb3NpdG9yeT8NCk1heWJlIG9uZSBkb2N1bWVudCBpcyBwcmVmZXJhYmxlIGZvciB0aGlzLg0K
VGhhbmtzLg0KDQpSZWdhcmRzLA0KR3VjaHVuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBP
biBCZWhhbGYgT2YgTWljaGVsIETDpG56ZXINClNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDIwLCAy
MDE5IDEwOjU5IFBNDQpUbzogTWEsIExlIDxMZS5NYUBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFu
ZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogbGliZHJtIHBhdGNoIG1lcmdlIHJlcXVlc3QNCg0KT24g
MjAxOS0wOS0xOSA0OjU2IGEubS4sIE1hLCBMZSB3cm90ZToNCj4gVGhhbmtzIEFsZXguDQoNCkJU
VywgbWVyZ2UgcmVxdWVzdHMgKE1ScykgYXJlIGVuYWJsZWQgbm93IGZvciB0aGUgZHJtIHJlcG9z
aXRvcnksIHNvIGl0J3MgcHJvYmFibHkgYmVzdCB0byB1c2UgTVJzIGZyb20gbm93IG9uLg0KDQoN
Ci0tIA0KRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAg
ICAgIGh0dHBzOi8vcmVkaGF0LmNvbQ0KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAg
ICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
