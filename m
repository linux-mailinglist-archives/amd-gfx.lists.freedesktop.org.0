Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BBED3838
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 06:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19466E3F4;
	Fri, 11 Oct 2019 04:09:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690067.outbound.protection.outlook.com [40.107.69.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC3B6E3F4
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 04:09:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNkmajaCTuriikxXm314mloG+WfjYy3IqB4kp+gWau4c2Lo5ykYL8MrN6vOAzHxGOjOJXGSenOHJXx2oo9PCgD8pFE2TKkwn9G/Pbrdq19PvC+Ho8PQscbx4sDIG2TxFDHSNNeNpFwRSAoygViuB/6+JdsJWpepD4I8xYNLqw2kg0wxHEGZ8FfZ1hvjAT9OHK9VVp66/Lo/cATf/MIDd9KTuNObwljxnT5CgnhvAJbMNf0Sy9jC8DhbxgCEDmMvjN45XjhN/+qoNG4p8jdf3YICtv+N1Omv0knS8Sjz5VVDf1VG9YNG+xTr//CskPPxBhxXmKVrbCkCbuVI3u+C/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3Uw2KdSifPtg5JKUauyTA2HoRMVwyk6M+dHV9Jcg0Y=;
 b=afYbsFlKMasDrSlw6fngVKVQc2g8z4qOutf6S+RNrWQ3Mmfq6MCj5TwM9VGPCVoW2k2HJ4h9w3CC5GCkvijnHgzvz24uRVRuh49zNk/qJZzCLTzTNN85OHwAYErqesVj0LgnaAHe8/o7bmwyUwjtEbo/4CyspQuvyCiMnplRzrW3oVckQ/Bpjte3pILuTvTvF1ITgbJJ9GVapwJ2p/kYunpDGuFoKSf09K8Fh66h8OiStAZzBAaNjObXKeqWD0/6zolkvyjK9G7lwhxao5YFsesofXWpXdjCiudQ2Zup7YnM7R3OJP0k7KDzyq7YedIFKMngCEGeoQ/E8a2eyXLbEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3329.namprd12.prod.outlook.com (20.178.208.93) by
 BN8PR12MB3459.namprd12.prod.outlook.com (20.178.209.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 04:09:47 +0000
Received: from BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::28c4:55fd:ee27:8560]) by BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::28c4:55fd:ee27:8560%7]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 04:09:47 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 5/5] drm/amdgpu/soc15: add support for baco reset with
 swSMU
Thread-Topic: [PATCH 5/5] drm/amdgpu/soc15: add support for baco reset with
 swSMU
Thread-Index: AQHVf38iQqZj/jlhokOzrZS5lvAD+6dU1E5A
Date: Fri, 11 Oct 2019 04:09:47 +0000
Message-ID: <BN8PR12MB33298AE29C967F37F934CCD2E4970@BN8PR12MB3329.namprd12.prod.outlook.com>
References: <20191010152619.31011-1-alexander.deucher@amd.com>
 <20191010152619.31011-6-alexander.deucher@amd.com>
In-Reply-To: <20191010152619.31011-6-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73d68470-d22a-4313-0c67-08d74e00db0b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3459:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3459F02321B60088B8D8F72AE4970@BN8PR12MB3459.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(13464003)(199004)(8936002)(256004)(81166006)(81156014)(25786009)(33656002)(55016002)(8676002)(6306002)(6436002)(66066001)(2501003)(26005)(4326008)(6246003)(476003)(3846002)(6116002)(186003)(5660300002)(486006)(52536014)(305945005)(7736002)(9686003)(66556008)(66476007)(74316002)(53546011)(66446008)(102836004)(6506007)(11346002)(99286004)(14454004)(316002)(446003)(64756008)(76116006)(478600001)(86362001)(229853002)(2906002)(71200400001)(71190400001)(110136005)(66946007)(76176011)(7696005)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3459;
 H:BN8PR12MB3329.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /9zeiyJ8jnFfkn5xnomT1YKqf5GAkVR4eIA2QQU9DAisq44eHF2bwRnad/0XFaF0jAAGz5+ycRa6CHXzpm6US3My8yc+3gZlsqA4BRlZHQAGp1NWPZI2k8V8rEkWp0ZPE+e5P7bAY+s8Y/E6npDTFiKNyHRLfncjeF/Hkbwq3RG7/ll6M1IB+rWxqzTobU5yADqYEpEA8085u5De1qSxpK9sdq8POfXYYGCM6ftXdZgl6w27gUSmB6GhRiiZG+YnH03wRT2HUv45MQu7rzPNWtLfdMVRzw3uZyT8nEbcEq05Meq9h/UZN6PdTQUO57ZyTmTv6PTH9NVgPNiJnFNYbDpoE7B/ht304YMjWHPRyYP6u1pC/aYHivKU5lX/e0XsUK6Pbxw+1kU9Jili6tkORIP/e2g99h3ayMEA4AeHXuQ2l3YrzhjjWmMQmnhdmGf1i4c1mBkuk4s0O9kyTU3AWg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d68470-d22a-4313-0c67-08d74e00db0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 04:09:47.6016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zL19PFvus07AIcFowjeOrnQ978IBVhU5H9J5OZI/Ab/0rb2Xk3xADFBiO3lLjkxi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3459
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3Uw2KdSifPtg5JKUauyTA2HoRMVwyk6M+dHV9Jcg0Y=;
 b=WMhZog+CkjRJgBCEUsd7TYXBxcAkR2xtKpvfl/TmTtccMQ0Rd4D2IvVHk1jTOnTWo561kk7gklSXjBbrBs2YSZQbY0KETTdX9fzpS/45k4Hr59Lo7lbwCaKSap45FFYP263SgtsMpZCGAGYxPd9eioLhyPaGxMqPEhj63oBqVMY=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RXhjZXB0IHBhdGNoMiwgc2VyaWVzIGlzIHJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVh
bkBhbWQuY29tPg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8
YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXgg
RGV1Y2hlcg0KU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTAsIDIwMTkgMTE6MjYgUE0NClRvOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxl
eGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCA1LzVdIGRybS9hbWRncHUv
c29jMTU6IGFkZCBzdXBwb3J0IGZvciBiYWNvIHJlc2V0IHdpdGggc3dTTVUNCg0KQWRkIHN1cHBv
cnQgZm9yIHZlZ2EyMCB3aGVuIHRoZSBzd1NNVSBwYXRoIGlzIHVzZWQuDQoNClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCi0tLQ0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCA1MyArKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25z
KC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KaW5kZXggZDE3NTY4ZGQ5ZTg3Li5i
MzI5MWExOWE3NzEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2Mx
NS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQpAQCAtNDc4LDM2
ICs0NzgsNTEgQEAgc3RhdGljIGludCBzb2MxNV9hc2ljX21vZGUxX3Jlc2V0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQ0KIA0KIHN0YXRpYyBpbnQgc29jMTVfYXNpY19nZXRfYmFjb19jYXBh
YmlsaXR5KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBib29sICpjYXApICB7DQotCXZvaWQg
KnBwX2hhbmRsZSA9IGFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGU7DQotCWNvbnN0IHN0cnVjdCBh
bWRfcG1fZnVuY3MgKnBwX2Z1bmNzID0gYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzOw0KKwlpZiAo
aXNfc3VwcG9ydF9zd19zbXUoYWRldikpIHsNCisJCXN0cnVjdCBzbXVfY29udGV4dCAqc211ID0g
JmFkZXYtPnNtdTsNCiANCi0JaWYgKCFwcF9mdW5jcyB8fCAhcHBfZnVuY3MtPmdldF9hc2ljX2Jh
Y29fY2FwYWJpbGl0eSkgew0KLQkJKmNhcCA9IGZhbHNlOw0KLQkJcmV0dXJuIC1FTk9FTlQ7DQot
CX0NCisJCSpjYXAgPSBzbXVfYmFjb19pc19zdXBwb3J0KHNtdSk7DQorCQlyZXR1cm4gMDsNCisJ
fSBlbHNlIHsNCisJCXZvaWQgKnBwX2hhbmRsZSA9IGFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGU7
DQorCQljb25zdCBzdHJ1Y3QgYW1kX3BtX2Z1bmNzICpwcF9mdW5jcyA9IGFkZXYtPnBvd2VycGxh
eS5wcF9mdW5jczsNCiANCi0JcmV0dXJuIHBwX2Z1bmNzLT5nZXRfYXNpY19iYWNvX2NhcGFiaWxp
dHkocHBfaGFuZGxlLCBjYXApOw0KKwkJaWYgKCFwcF9mdW5jcyB8fCAhcHBfZnVuY3MtPmdldF9h
c2ljX2JhY29fY2FwYWJpbGl0eSkgew0KKwkJCSpjYXAgPSBmYWxzZTsNCisJCQlyZXR1cm4gLUVO
T0VOVDsNCisJCX0NCisNCisJCXJldHVybiBwcF9mdW5jcy0+Z2V0X2FzaWNfYmFjb19jYXBhYmls
aXR5KHBwX2hhbmRsZSwgY2FwKTsNCisJfQ0KIH0NCiANCiBzdGF0aWMgaW50IHNvYzE1X2FzaWNf
YmFjb19yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgIHsNCi0Jdm9pZCAqcHBfaGFu
ZGxlID0gYWRldi0+cG93ZXJwbGF5LnBwX2hhbmRsZTsNCi0JY29uc3Qgc3RydWN0IGFtZF9wbV9m
dW5jcyAqcHBfZnVuY3MgPSBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3M7DQorCWlmIChpc19zdXBw
b3J0X3N3X3NtdShhZGV2KSkgew0KKwkJc3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSAmYWRldi0+
c211Ow0KIA0KLQlpZiAoIXBwX2Z1bmNzIHx8IXBwX2Z1bmNzLT5nZXRfYXNpY19iYWNvX3N0YXRl
IHx8IXBwX2Z1bmNzLT5zZXRfYXNpY19iYWNvX3N0YXRlKQ0KLQkJcmV0dXJuIC1FTk9FTlQ7DQor
CQlkZXZfaW5mbyhhZGV2LT5kZXYsICJHUFUgQkFDTyByZXNldFxuIik7DQorDQorCQlyZXR1cm4g
c211X2JhY29fcmVzZXQoc211KTsNCisJfSBlbHNlIHsNCisJCXZvaWQgKnBwX2hhbmRsZSA9IGFk
ZXYtPnBvd2VycGxheS5wcF9oYW5kbGU7DQorCQljb25zdCBzdHJ1Y3QgYW1kX3BtX2Z1bmNzICpw
cF9mdW5jcyA9IGFkZXYtPnBvd2VycGxheS5wcF9mdW5jczsNCiANCi0JLyogZW50ZXIgQkFDTyBz
dGF0ZSAqLw0KLQlpZiAocHBfZnVuY3MtPnNldF9hc2ljX2JhY29fc3RhdGUocHBfaGFuZGxlLCAx
KSkNCi0JCXJldHVybiAtRUlPOw0KKwkJaWYgKCFwcF9mdW5jcyB8fCFwcF9mdW5jcy0+Z2V0X2Fz
aWNfYmFjb19zdGF0ZSB8fCFwcF9mdW5jcy0+c2V0X2FzaWNfYmFjb19zdGF0ZSkNCisJCQlyZXR1
cm4gLUVOT0VOVDsNCiANCi0JLyogZXhpdCBCQUNPIHN0YXRlICovDQotCWlmIChwcF9mdW5jcy0+
c2V0X2FzaWNfYmFjb19zdGF0ZShwcF9oYW5kbGUsIDApKQ0KLQkJcmV0dXJuIC1FSU87DQorCQkv
KiBlbnRlciBCQUNPIHN0YXRlICovDQorCQlpZiAocHBfZnVuY3MtPnNldF9hc2ljX2JhY29fc3Rh
dGUocHBfaGFuZGxlLCAxKSkNCisJCQlyZXR1cm4gLUVJTzsNCiANCi0JZGV2X2luZm8oYWRldi0+
ZGV2LCAiR1BVIEJBQ08gcmVzZXRcbiIpOw0KKwkJLyogZXhpdCBCQUNPIHN0YXRlICovDQorCQlp
ZiAocHBfZnVuY3MtPnNldF9hc2ljX2JhY29fc3RhdGUocHBfaGFuZGxlLCAwKSkNCisJCQlyZXR1
cm4gLUVJTzsNCiANCi0JcmV0dXJuIDA7DQorCQlkZXZfaW5mbyhhZGV2LT5kZXYsICJHUFUgQkFD
TyByZXNldFxuIik7DQorDQorCQlyZXR1cm4gMDsNCisJfQ0KIH0NCiANCiBzdGF0aWMgaW50IHNv
YzE1X21vZGUyX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KLS0NCjIuMjAuMQ0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdm
eCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
