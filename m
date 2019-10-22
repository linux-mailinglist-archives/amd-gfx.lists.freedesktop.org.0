Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D48EE06C1
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 16:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74BD6E835;
	Tue, 22 Oct 2019 14:50:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E436E835
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 14:50:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUxx61BHS+ldg7Fx6CE8I9GlIAVUKp4MqRXWh4fsttwHZOc4qsBC5SHbwuSpArKslQjdkX+u9EODD580qRj93/0NuN/Um3B0bEbWd7csUuQjgCDkC4jRQHw1ROdNLP3Ve0OjWy2kSUkqXvpFYTUtGzvDcHyEMwNfgEZ2yJZ+mdZWvnqu2R3Zb/m5mp7zeujI1YoND9hqrpE4ZnQrYRPbTUqz1/JaNsWw9Vi3cmvdjRJ7RKwqnKrFRpcuSNHhpDvXNAD6lMWWnUbNgEif0InpY/J3/uYnhi2vZEOnvETwOc8xcaEZvkjyetQohrZbR9B0RxhWteCZSHjCzcyesQqHBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNJHnhPnKOFxueY2YtDII5NiINN3Ehb/cUIsgGSJ5mQ=;
 b=jwZwTZF5D2ac2G71+vF2WXZiFGGogElpyJ4jowh89KS1WMDr39zPBAVqCXBCxdmOb6P5A98OFDWeiE4NVDU1fhFaiSfMdECJRknhgtDa6xHdoissEljmi2AzR3ET5PJSyWa1DaUVycEV7S8aWWacXXJ6+Uwf1jwG9QAoKiYOKP5fdSYZD1XwC5+Z2As0xRfXa2aW3gnPJ36fsdGkHVOa4PbjAjeZG8X+txkDh+e9se03OgAlTmIKBpWBUgGIxO+2+niv04+T96zL9TVD3SwOg27ipDcZsJjvC4/ntbweyiW9bpqkTKgCaZgWf3Ce4TlcR2GsKNKjaDvB2CzWStaF7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB1305.namprd12.prod.outlook.com (10.168.237.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 14:50:29 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::897a:2315:ecf8:48e5]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::897a:2315:ecf8:48e5%5]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 14:50:28 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "Zhu, James" <James.Zhu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/vcn: Enable VCN2.5 encoding
Thread-Topic: [PATCH] drm/amdgpu/vcn: Enable VCN2.5 encoding
Thread-Index: AQHViOfa3EMIa6k/q0ePItLmq/KJz6dmvhmg
Date: Tue, 22 Oct 2019 14:50:28 +0000
Message-ID: <DM5PR12MB2456F9E06D30C7AE9202E955E5680@DM5PR12MB2456.namprd12.prod.outlook.com>
References: <1571755708-12173-1-git-send-email-James.Zhu@amd.com>
In-Reply-To: <1571755708-12173-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3f5d3f70-21f1-4192-b7f4-08d756ff2e50
x-ms-traffictypediagnostic: DM5PR12MB1305:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1305B027E15438B56FAF9DB3E5680@DM5PR12MB1305.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(189003)(199004)(13464003)(446003)(476003)(186003)(486006)(71200400001)(11346002)(6116002)(110136005)(316002)(71190400001)(26005)(3846002)(33656002)(2906002)(2501003)(66066001)(5660300002)(52536014)(6306002)(55016002)(6436002)(9686003)(305945005)(6246003)(81166006)(66446008)(64756008)(66556008)(81156014)(229853002)(8676002)(7736002)(8936002)(4326008)(74316002)(76116006)(66476007)(66946007)(25786009)(53546011)(6506007)(478600001)(102836004)(256004)(7696005)(99286004)(86362001)(14454004)(966005)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1305;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Aco7MBp3jU49etXt17/HFNesf5TVoqKljoxWo1YRg/30b2mWvs7YGbr4sVwAgvdcMHPuItnyKz8RPmeC+pzjaZrUaLNo3SnHLuiA1TF8Xy+MEJMwnQ6e93ugRqozyrWCVzKgXvJyXfeQCWpuM41Etl5K9wKG/4bjcwY7/1b7+oVFMtZyZU82HWWDKSdZXktqqlOvt7Cvz3wDOv5g6C9EsrS6gEc2CXzBFD5vhYxAhtugvUJBjnuSZhq1QPE0RMzPAumJJCFdB+NKJMbb6Dn/7mkjv+eOc9nNkqt69rkiHjXzD5jcbOpTo1IjqVHrLF8nFJKH04odX0CYpY8uYU1nspiQp7X1qyZqxEJWppYnBy6GpyiHie+IIVOpNJ2F8K0c6QMxUakOO8nRKY/brJftWxb5JFIVN92e+7iUCCoVv96WD+cwN+2Lj1S0LtLCj98je2LkwZedlDcdv66A9yqzjwDS5JhVvrygDlSM8hlnFGE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5d3f70-21f1-4192-b7f4-08d756ff2e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 14:50:28.7906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XJpfh5hCh13gBCHbFA4/3ghiSoTKTk22XrEwJPMlHTg5f2BuAnTds1L/ecBWWpYM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1305
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNJHnhPnKOFxueY2YtDII5NiINN3Ehb/cUIsgGSJ5mQ=;
 b=jPbWzdt+pgyyGwWej5H0/62rLtrWLzgAhp8qxLfVCv0jal9HADtdgW5j6EbiR2Y/lojBfTUP+CYWbZgBFnej8S95Rc31Ley9boDPxavNBMb0M0cS3fLD0c0aZeRm02AgGrTCgYOS/hZ8MmkDbYWboDwriRz2DxDjhIVMsuiGHbI=
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
Cc: "Zhu, James" <James.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4NCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBaaHUsIEphbWVzDQpTZW50OiBUdWVzZGF5LCBPY3RvYmVy
IDIyLCAyMDE5IDEwOjQ5IEFNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNj
OiBaaHUsIEphbWVzIDxKYW1lcy5aaHVAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2Ft
ZGdwdS92Y246IEVuYWJsZSBWQ04yLjUgZW5jb2RpbmcNCg0KQWZ0ZXIgVkNOMi41IGZpcm13YXJl
IChWZXJzaW9uIEVOQzogMS4xICBSZXZpc2lvbjogMTEpLA0KVkNOMi41IGVuY29kaW5nIGNhbiB3
b3JrIHByb3Blcmx5Lg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBaaHUgPEphbWVzLlpodUBhbWQu
Y29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyB8IDMgLS0t
DQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3YyXzUuYw0KaW5kZXggZDI3MGRmOC4uZmY2Y2M3NyAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3Zjbl92Ml81LmMNCkBAIC0yNjUsOSArMjY1LDYgQEAgc3RhdGljIGludCB2Y25f
djJfNV9od19pbml0KHZvaWQgKmhhbmRsZSkNCiANCiAJCWZvciAoaSA9IDA7IGkgPCBhZGV2LT52
Y24ubnVtX2VuY19yaW5nczsgKytpKSB7DQogCQkJcmluZyA9ICZhZGV2LT52Y24uaW5zdFtqXS5y
aW5nX2VuY1tpXTsNCi0JCQkvKiBkaXNhYmxlIGVuY29kZSByaW5ncyB0aWxsIHRoZSByb2J1c3Ru
ZXNzIG9mIHRoZSBGVyAqLw0KLQkJCXJpbmctPnNjaGVkLnJlYWR5ID0gZmFsc2U7DQotCQkJY29u
dGludWU7DQogCQkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfaGVscGVyKHJpbmcpOw0KIAkJCWlmIChy
KQ0KIAkJCQlnb3RvIGRvbmU7DQotLSANCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
