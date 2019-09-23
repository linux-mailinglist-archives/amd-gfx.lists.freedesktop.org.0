Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20741BB5DB
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 15:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEF86E91E;
	Mon, 23 Sep 2019 13:58:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760072.outbound.protection.outlook.com [40.107.76.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC21C6E91E
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 13:57:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4kiJMP/CKGx1qRy8Ot61aiwgMFRNNX1BP0IGXQt0YB9J4y6UOJ1fC6U2NdPmu4IjIA3MlCucFT2gD3zTqMmIiwzycqFXQcbQmviYmqtBEYauO44VPb/Wc52wVbDYaa/Yz1h9DzSX0bfiCDTcMoasEzeuhLtL4sBwCYWhxS8UlpN3lst83YddiT6NItkS8ZmQhzEze8hBz2puemMYfq97KnYsz25Y0zJMC1JQBp8QTEWe+Fz8fMT1oFNHjvc5XeMSJ7Jb9cHIigkUAZdqaSckjoOnISxRWzkG07/TVeEMRIyHnekoikKxUkYCerJlM9yCsho84+oNp48Le+6qX/fiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqDDYrPw4W2LydWv9y91trELQ7orSY85hTjYM2KCGPM=;
 b=NByo+c8fmiMzcJAI49mQ+CROLRshwHOYqTXXXcM+UmvWwrYTL/7sFgbliNpzlt/tn02a1UgSmrQpYjKEqbNsbspphEoggJqD5cXmk1ey/wWeCVtyJMhiP22IgpU09pzd3t9bJO0jGaQ9EZASa3yvqPlyibbXqI3CPcf6+OaZ6s1777pnRu/VXJd89LPCA0gyBMr/dCij+8UEmC6Fdm1Jg/+CgvAzrDNd5P/08c+kV9M0KV2uCzlK0t+99TuGkOuE//X3VEzhz/UAO7QebO7305F89KqB6wXHBWb8AcoFWQaJSx642k3W2rxBouCtie1ePsGfQGHJR+rFV1Nt8o0IWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2486.namprd12.prod.outlook.com (52.132.140.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 13:57:55 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 13:57:55 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: correct condition check for psp rlc
 autoload
Thread-Topic: [PATCH 2/2] drm/amdgpu: correct condition check for psp rlc
 autoload
Thread-Index: AQHVchMj0PVXhbM3XUWPSqmtM2VfBKc5SU9g
Date: Mon, 23 Sep 2019 13:57:54 +0000
Message-ID: <DM5PR12MB1418F78B0374568673ED5EC7FC850@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1569245443-27318-1-git-send-email-le.ma@amd.com>
 <1569245443-27318-2-git-send-email-le.ma@amd.com>
In-Reply-To: <1569245443-27318-2-git-send-email-le.ma@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cef79f9-c01a-4afc-c17a-08d7402e0878
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2486; 
x-ms-traffictypediagnostic: DM5PR12MB2486:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2486E9165AD2B91A12B6623CFC850@DM5PR12MB2486.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(189003)(199004)(13464003)(5660300002)(316002)(11346002)(6436002)(7736002)(186003)(9686003)(26005)(478600001)(2501003)(446003)(55016002)(81156014)(486006)(966005)(6306002)(8676002)(81166006)(86362001)(99286004)(8936002)(229853002)(110136005)(6116002)(476003)(25786009)(3846002)(66476007)(74316002)(6506007)(7696005)(52536014)(256004)(14444005)(14454004)(53546011)(66946007)(64756008)(71190400001)(33656002)(66556008)(66446008)(76176011)(4326008)(66066001)(71200400001)(102836004)(2906002)(305945005)(6246003)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2486;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C/f7K8DQojvNWbp3lChjUzquSZz2gDQQFyAUXFdraGXLci7Cgq81x2mF+ZHOFrZh9BaIeInJtD1F/v3jTjTrh724n/xfZ9YuYFy2r0J+bD1dbU/Wo30DPH/rBgFcjibn9hqops2x5hD7QL4JZxqbB9DK4DavEyp/EsR/H7+H7yS49ON6HX5vIQ62Au1AWm5hi9/PYbPJQeFtNP+bkuM9bL2/N8iWB4f+VO/rP2XvajsNXbrfuisKBTKNZ0a9WRxQFHk3pkPFcgPGhmjJ532no+7muJmtCeDglgKnqxACP2kPeA/P3D31F3k/Io54Yb96CtPmoW9XIBLq+oqfPkyWCR9bTbnIxIZYRkfdxT/AXx9n71tGYWq7PcqQQrfEwb4pdK4HjGJgP5O00Ce9pMx7XgLaPufdqtkWSMC+xAkX6Ws=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cef79f9-c01a-4afc-c17a-08d7402e0878
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 13:57:55.0039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZeAER6v9hQpWY66q0wbue33rcEnnRplAekRotjFSGM5okRFISv5kLImUP6wZpnh5Ef1Atd95grhQyCePHXyGAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2486
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqDDYrPw4W2LydWv9y91trELQ7orSY85hTjYM2KCGPM=;
 b=e12okeLn+1EKKoswwjvHy9ptZZYwXomhn2osOy84ir+I+ZbgKS6XL6Q+kbNLIUlsDR8oahubqyVW9bF4ZMQx5q7DqLfJEAC5mwE1uhRnC3UxmFRdhkg6JQFkBjCr7oZidV/Bv5U1s7hOZ6O1JhtVRIgy4kLDiyKrkYpgsF/0F0A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Ma, Le" <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGxlYXNlIGhlbHAgdG8gYWRkIHNpbXBsZSBkZXNjcmlwdGlvbiBmb3IgYm90aCBwYXRjaGVzLiB3
aXRoIHRoYXQgZml4ZWQsDQoNClNlcmllcyBpcyBSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8
SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KDQpSZWdhcmRzLA0KSGF3a2luZw0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIExlIE1hDQpTZW50OiAyMDE55bm0OeaciDIz5pel
IDIxOjMxDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBNYSwgTGUgPExl
Lk1hQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0vYW1kZ3B1OiBjb3JyZWN0IGNv
bmRpdGlvbiBjaGVjayBmb3IgcHNwIHJsYyBhdXRvbG9hZA0KDQpDaGFuZ2UtSWQ6IElhOTFkMGZi
NzE3OWY2OTQ0MjE0ZTg5MmYzNzBkN2VmM2Q2YjdkMzBlDQpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8
bGUubWFAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYyB8IDMgKystDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bz
cC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jDQppbmRleCBkMzU5
ZjFkLi4yYWExYWU2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMN
CkBAIC0xMDgwLDcgKzEwODAsOCBAQCBzdGF0aWMgaW50IHBzcF9ucF9md19sb2FkKHN0cnVjdCBw
c3BfY29udGV4dCAqcHNwKQ0KIAkJCXJldHVybiByZXQ7DQogDQogCQkvKiBTdGFydCBybGMgYXV0
b2xvYWQgYWZ0ZXIgcHNwIHJlY2lldmVkIGFsbCB0aGUgZ2Z4IGZpcm13YXJlICovDQotCQlpZiAo
dWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9STENfUkVTVE9SRV9MSVNUX1NSTV9N
RU0pIHsNCisJCWlmIChwc3AtPmF1dG9sb2FkX3N1cHBvcnRlZCAmJiB1Y29kZS0+dWNvZGVfaWQg
PT0NCisJCQlBTURHUFVfVUNPREVfSURfUkxDX1JFU1RPUkVfTElTVF9TUk1fTUVNKSB7DQogCQkJ
cmV0ID0gcHNwX3JsY19hdXRvbG9hZChwc3ApOw0KIAkJCWlmIChyZXQpIHsNCiAJCQkJRFJNX0VS
Uk9SKCJGYWlsZWQgdG8gc3RhcnQgcmxjIGF1dG9sb2FkXG4iKTsNCi0tIA0KMi43LjQNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFp
bGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
