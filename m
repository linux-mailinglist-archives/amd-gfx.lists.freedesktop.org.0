Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD40C41C2
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 22:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0A189CAC;
	Tue,  1 Oct 2019 20:24:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690057.outbound.protection.outlook.com [40.107.69.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D287D89CAC
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Oct 2019 20:24:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R143xPsE6+rEif7IoR4hYoAQ8Q9rZgLbjPYZ4c97fzPUpGMbD9tCfzJ5uhXVoTVPbhMOaPLjwk6NkPb1rFTkHkyCgRuJP+IYJ0K1yyIY/1+TtIhMFinLGZZTbSDq+ardE6UU4AG9CIIl/exjkF34BT1V9ze47eqL7nlZbpmjNxD6crP9mSIq713iDMzUz6BwA54EamyubONY3XI/ohT0arYfkzB5dxCnESkLRV52wYnz0B+ZUWH4YZJ0O6rTeMaB3u4GvEnfDrAM0ErjBfViSgloBn/XADBXhMcLwaBI09whEyrtmSxAFFNGm3aLwPgVsZsdYJYkIBDlcI+hNHy3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4VD4NzzSaQpkZl3sngZvDYSG3aTyi48brOWCL3qrkI=;
 b=DyoApr6C2qsdyoWpH97VI/qP6LkcvjZBDNXQvpFKrs9tHH1DsmHGXA3rb8q1bTU/M5TyxR2pMOa6cuMxvw9PyDnSWytIqnKH+xKdtI3XJYMg6ZGEwDb12vKb7wdf/ab72Vclq4xWJlTXoO0IKvVG2PqK/3OsqPHQvoExQSWeNb9AKUUkXL7aDDuAt77TH0M+hDJ7PHi2j5OZzCStWVPDwJQO/tBuVbTkcSL4353aQiD/6TyWdrd5S24OnVni49V+K/s0+j0VCHitKGTuh70B+92l5nJzmhgIQzHJqtPMPrHS01rXfcZyrMBBHSqxuv6b4LtIj+qfzojrgK1ZNjZONw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3001.namprd12.prod.outlook.com (20.178.29.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 20:24:53 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.028; Tue, 1 Oct 2019
 20:24:53 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Improve KFD IOCTL printing
Thread-Topic: [PATCH] drm/amdkfd: Improve KFD IOCTL printing
Thread-Index: AQHVd9nEEN35uuHp/0SrpqOpwBARLadGPMsA
Date: Tue, 1 Oct 2019 20:24:53 +0000
Message-ID: <45699a0d-4c70-da77-e592-db4e354c640e@amd.com>
References: <20190930215513.3570-1-Yong.Zhao@amd.com>
In-Reply-To: <20190930215513.3570-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YT1PR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::24)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61339cc9-1f54-4609-8f72-08d746ad6ae0
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3001:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3001D4E4F84BD14695ED1237929D0@DM6PR12MB3001.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:276;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(189003)(199004)(6486002)(6436002)(386003)(2906002)(76176011)(99286004)(102836004)(58126008)(81166006)(3846002)(316002)(229853002)(52116002)(81156014)(8676002)(36756003)(6116002)(8936002)(26005)(66446008)(6506007)(31696002)(186003)(6512007)(110136005)(6246003)(256004)(71200400001)(71190400001)(86362001)(53546011)(486006)(14454004)(11346002)(2616005)(446003)(25786009)(476003)(305945005)(5660300002)(7736002)(66556008)(66476007)(66946007)(65806001)(66066001)(478600001)(2501003)(64756008)(65956001)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3001;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oZuluxhdZwNKR3T7nzQ1PM8FldnUi7zyHLHdOlrAhUfXA2VJh8PvH62BK4Y8CvIpbUJhSUUKxbYAijiXP5If4Zp6G/V35KHkNZWCUukE/fhIsKYMNQ++f53TAgcUWfpGM+OwFGQ7CC1iF1ZB3QyaskSdqyTGHo4NmYHJT2VCMOIEl2IOBn9eF56vh1Sj5OO8cCLlIJfQpx+p3iWs39R60wMR/x1EeFgYmYR7TOddpmPOFA+F4nyGYpa/XlRR5g/xT3hlZaXNzsnTke/dbjsK9hT0Ydz27YHjzWfJd6UGPDez3yMEE2+4br8UpG78WvVaS8+DNe8Sa7PZ91tO+mv9m+1kEnkCOLG4Xq/4700enZCZ3GwOH6ke/i5Eie8ss3E/82+KCiFPzBwudaYqMaNkF6rtZ8a2RT/ifgrLaB+vfYQ=
Content-ID: <3B9D8913CBF96D4DAC343C309EEF49B2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61339cc9-1f54-4609-8f72-08d746ad6ae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 20:24:53.3702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yOAKe/S5cmut+vjHYOVbYtcGiQzQEUL85SJ4/yf8GtzKarAkosLENr1MKADtJtnlzu8lmaoW4VNuCWC/9MbiWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3001
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4VD4NzzSaQpkZl3sngZvDYSG3aTyi48brOWCL3qrkI=;
 b=Fwm3DQnWgcBO6dXY6TQ6tpL3sZ/05HCcxfiv6m0fVTlbWTw1JyIP3pzTmXXZq9dbHV/X+BEYsfc605Dtxxgeh36AIASj6TRdH3uYYfrAtP77NZ8J7z8VQungKTzOhpZj2HfTucsIUXboTyD3PlTdrXXBpRid4ejVbTz2edGoqkE=
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

T24gMjAxOS0wOS0zMCAxNzo1NSwgWmhhbywgWW9uZyB3cm90ZToNCj4gVGhlIGNvZGUgdXNlIGhl
eCBkZWZpbmUsIHNvIHNob3VsZCB0aGUgcHJpbnRpbmcuDQo+DQo+IENoYW5nZS1JZDogSWE3Y2M3
NjkwNTUzYmIwNDM5MTViM2Q4YzAxNTcyMTZjNjQ0MjFhNjANCj4gU2lnbmVkLW9mZi1ieTogWW9u
ZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5n
IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyB8IDUgKysrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9jaGFyZGV2LmMNCj4gaW5kZXggYzI4YmEwYzFkN2FjLi5kOWUzNmRiZjEzZDUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiBAQCAt
MTg0MCw3ICsxODQwLDcgQEAgc3RhdGljIGxvbmcga2ZkX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxl
cCwgdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZWQgbG9uZyBhcmcpDQo+ICAgCX0gZWxzZQ0KPiAg
IAkJZ290byBlcnJfaTE7DQo+ICAgDQo+IC0JZGV2X2RiZyhrZmRfZGV2aWNlLCAiaW9jdGwgY21k
IDB4JXggKCMlZCksIGFyZyAweCVseFxuIiwgY21kLCBuciwgYXJnKTsNCj4gKwlkZXZfZGJnKGtm
ZF9kZXZpY2UsICJpb2N0bCBjbWQgMHgleCAoIzB4JXgpLCBhcmcgMHglbHhcbiIsIGNtZCwgbnIs
IGFyZyk7DQo+ICAgDQo+ICAgCXByb2Nlc3MgPSBrZmRfZ2V0X3Byb2Nlc3MoY3VycmVudCk7DQo+
ICAgCWlmIChJU19FUlIocHJvY2VzcykpIHsNCj4gQEAgLTE4OTUsNyArMTg5NSw4IEBAIHN0YXRp
YyBsb25nIGtmZF9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZXAsIHVuc2lnbmVkIGludCBjbWQsIHVu
c2lnbmVkIGxvbmcgYXJnKQ0KPiAgIAkJa2ZyZWUoa2RhdGEpOw0KPiAgIA0KPiAgIAlpZiAocmV0
Y29kZSkNCj4gLQkJZGV2X2RiZyhrZmRfZGV2aWNlLCAicmV0ID0gJWRcbiIsIHJldGNvZGUpOw0K
PiArCQlkZXZfZGJnKGtmZF9kZXZpY2UsICJpb2N0bCBjbWQgKCMweCV4KSwgYXJnIDB4JWx4LCBy
ZXQgPSAlZFxuIiwNCj4gKwkJCQluciwgYXJnLCByZXRjb2RlKTsNCj4gICANCj4gICAJcmV0dXJu
IHJldGNvZGU7DQo+ICAgfQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
