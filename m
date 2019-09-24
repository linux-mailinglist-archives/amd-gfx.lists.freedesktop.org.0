Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5049BCBEC
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 17:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0B688610;
	Tue, 24 Sep 2019 15:54:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800042.outbound.protection.outlook.com [40.107.80.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCE488710
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 15:54:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gT8ds78fn/vFPx7qAg7767nmY7rvRZ+YBnHM8fReCUkN3CvwvaEuXjAHtPFxKkOPtxm06QF6dQBf5ymTeQGSEH1UHD1gKdWoBcORSmfW8rpZFVOrGMGQ7iJ6xm9vUKBkKcfn+Q2LocVcTVOJe4T+SB73ptCQ2tlReEDGzXKjx3hAPdNnugDiHFclA2/R0aTQvM9I5W5V598blHO+6Eg1/ypGkGOY9VamDL0ca0/1gUKONlJ/iKq1sPkjJ+BqBARcIyl5G6e+WxRpiGOrfhUZs1ZiyqKI/CjH9DdkLLc5N+wDaFbJglpQR1GTux+mwKxCQmKribUvURsHgop/WFDxZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4J/NmVXX5PWfofOcal7bDVRflzQD29HG9FHkGyhBDM=;
 b=IMo/6JtwPYKA+eRIfahgrhqzipAH5A3T0qImBKFKOABy5AMvyVOM9L1tE4iRelGyPasd2nDyAFqSSb6NaC/2MTRVpb84rthKktHhxmU/DjRTKoZMLZUsoCtotXX19UZHSjmD6X+RqpsgGfaQR7KRaWesxlYl+WA/7ZAqepoXUmszeyTR8n0SfQLYZRb+XTC7Ko4Iv8jjO7xxH05T+KRv3aCkEO1lJOxgqUcAPzKCBVgF0Od0M5bp4YBsc3oaNwOBuS66ENWLmE5scRJbaMXwsXCCk1dGS0Ve/fEg0R0uX9HyTnpooYkJzsREa58SW3VG2qF7T+pn7huwfncsmPQMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) by
 MN2PR12MB3454.namprd12.prod.outlook.com (20.178.242.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 15:54:47 +0000
Received: from MN2PR12MB2911.namprd12.prod.outlook.com
 ([fe80::c8cf:fab8:48c1:8cee]) by MN2PR12MB2911.namprd12.prod.outlook.com
 ([fe80::c8cf:fab8:48c1:8cee%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 15:54:47 +0000
From: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
To: "tj@kernel.org" <tj@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "airlied@redhat.com" <airlied@redhat.com>
Subject: RE: [PATCH v2 3/4] device_cgroup: Export devcgroup_check_permission
Thread-Topic: [PATCH v2 3/4] device_cgroup: Export devcgroup_check_permission
Thread-Index: AQHVbLlix8wpR6fijka6GKZIrnMmXKc7BmWA
Date: Tue, 24 Sep 2019 15:54:47 +0000
Message-ID: <MN2PR12MB2911F59E9B91AAD349B4E40F8C840@MN2PR12MB2911.namprd12.prod.outlook.com>
References: <20190916180523.27341-1-Harish.Kasiviswanathan@amd.com>
 <20190916180523.27341-4-Harish.Kasiviswanathan@amd.com>
In-Reply-To: <20190916180523.27341-4-Harish.Kasiviswanathan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75b40770-4807-4e07-7c77-08d741078685
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3454; 
x-ms-traffictypediagnostic: MN2PR12MB3454:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34545A0A61BE72F6016363F58C840@MN2PR12MB3454.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(13464003)(189003)(199004)(25786009)(86362001)(3846002)(6116002)(186003)(4326008)(81156014)(2501003)(33656002)(81166006)(478600001)(26005)(76176011)(14454004)(8676002)(8936002)(99286004)(7696005)(53546011)(110136005)(54906003)(102836004)(6506007)(316002)(476003)(7736002)(9686003)(55016002)(486006)(74316002)(76116006)(66446008)(66556008)(66476007)(6436002)(14444005)(52536014)(2906002)(64756008)(305945005)(229853002)(71190400001)(71200400001)(66946007)(66066001)(256004)(11346002)(5660300002)(6246003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3454;
 H:MN2PR12MB2911.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gn27aihubt4E0E8paVdK0E4NCwwTaTc3W3lv4AGvfECyJ3TLezwn5zvS0sIBuPAGJScxrXhNp73KG6uMA++w7+tbLVemVweRZ560ULjrgTnzACMc875RNYEmL53RQtU/yykvv7zcNVwXmSN30Q1mcAkwG0ih/ESOqRbRJ6iz6JpB8bncsn1rFl0i/9bevDxKXcWuH9ecpUpWubJizssytUXYcLWO2VLfFDaAddbdNdbWadlmxQUkcEbMhBMCVAZ0AyLZbkpteKypjhYu+dvgcYNJl4jmdiyMY7rtesPeOGrIvGt8JlbUs820GIUeAPmEJ+a6F3GMtTleQHEpZz3Zu2RiRKTJvrRio0OOnQA3cYgIFu6EdtHrB3goPm5JDB19VnlQ0i3ZUDQOl/XssZlINQX6SqlNmZNPRxJP9VzfweI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b40770-4807-4e07-7c77-08d741078685
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 15:54:47.2206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ug3lEScd47osORLMSnRXHSoUxqvKmlQj5lWBbTQVsN/I5Cd4DtKS9neYkLkJSopqyCaRzyjtsTDEmRFf+CWV9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4J/NmVXX5PWfofOcal7bDVRflzQD29HG9FHkGyhBDM=;
 b=EM4LtK1XlhKGmF5viJ9Qzwc0AW7Nw/HgwQnZLWTWxR4M3D4iXMiyAUQo0erkD6EE0sikLQdMOP9XvLAb2NtBWgMxZ59jJ2Ja0Eo2uVIy7ZmV4VqVR3yxejbxRqdp8tHVnA2yjUFViSKAmEfvYmrchphL33As3TnFb7xTUrPRCW0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harish.Kasiviswanathan@amd.com; 
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
Cc: "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgVGVqdW4sCgpDYW4geW91IHBsZWFzZSByZXZpZXcgdGhpcz8gWW91IGFuZCBSb21hbiBhY2tl
ZCB0aGlzIHBhdGNoIGJlZm9yZS4gSXQgd2lsbCBiZSBncmVhdCBpZiBJIGNhbiBSZXZpZXdlZC1i
eSwgc28gdGhhdCBJIGNhbiB1cHN0cmVhbSB0aGlzIHRocm91Z2ggQWxleCBEZXVjaGVyJ3MgYW1k
LXN0YWdpbmctZHJtLW5leHQgYW5kIERhdmUgQWlybGllJ3MgZHJtLW5leHQgdHJlZXMKClRoYW5r
cywKSGFyaXNoCgoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogS2FzaXZpc3dhbmF0
aGFuLCBIYXJpc2ggPEhhcmlzaC5LYXNpdmlzd2FuYXRoYW5AYW1kLmNvbT4gClNlbnQ6IE1vbmRh
eSwgU2VwdGVtYmVyIDE2LCAyMDE5IDI6MDYgUE0KVG86IHRqQGtlcm5lbC5vcmc7IERldWNoZXIs
IEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IGFpcmxpZWRAcmVkaGF0LmNv
bQpDYzogY2dyb3Vwc0B2Z2VyLmtlcm5lbC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBLYXNpdmlzd2FuYXRoYW4sIEhhcmlzaCA8SGFyaXNoLkthc2l2aXN3YW5hdGhhbkBhbWQu
Y29tPgpTdWJqZWN0OiBbUEFUQ0ggdjIgMy80XSBkZXZpY2VfY2dyb3VwOiBFeHBvcnQgZGV2Y2dy
b3VwX2NoZWNrX3Blcm1pc3Npb24KCkZvciBBTUQgY29tcHV0ZSAoYW1ka2ZkKSBkcml2ZXIuCgpB
bGwgQU1EIGNvbXB1dGUgZGV2aWNlcyBhcmUgZXhwb3J0ZWQgdmlhIHNpbmdsZSBkZXZpY2Ugbm9k
ZSAvZGV2L2tmZC4gQXMKYSByZXN1bHQgZGV2aWNlcyBjYW5ub3QgYmUgY29udHJvbGxlZCBpbmRp
dmlkdWFsbHkgdXNpbmcgZGV2aWNlIGNncm91cC4KCkFNRCBjb21wdXRlIGRldmljZXMgd2lsbCBy
ZWx5IG9uIGl0cyBncmFwaGljcyBjb3VudGVycGFydCB0aGF0IGV4cG9zZXMKL2Rldi9kcmkvcmVu
ZGVyTiBub2RlIGZvciBlYWNoIGRldmljZS4gRm9yIGVhY2ggdGFzayAoYmFzZWQgb24gaXRzCmNn
cm91cCksIEtGRCBkcml2ZXIgd2lsbCBjaGVjayBpZiAvZGV2L2RyaS9yZW5kZXJOIG5vZGUgaXMg
YWNjZXNzaWJsZQpiZWZvcmUgZXhwb3NpbmcgaXQuCgpDaGFuZ2UtSWQ6IEk5YWUyODNkZjU1MGIy
YzEyMmQ2Nzg3MGIwY2ZhMzE2YmZiZjNiNjE0CkFja2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVs
aXguS3VlaGxpbmdAYW1kLmNvbT4KQWNrZWQtYnk6IFRlanVuIEhlbyA8dGpAa2VybmVsLm9yZz4K
QWNrZWQtYnk6IFJvbWFuIEd1c2hjaGluIDxndXJvQGZiLmNvbT4KU2lnbmVkLW9mZi1ieTogSGFy
aXNoIEthc2l2aXN3YW5hdGhhbiA8SGFyaXNoLkthc2l2aXN3YW5hdGhhbkBhbWQuY29tPgotLS0K
IGluY2x1ZGUvbGludXgvZGV2aWNlX2Nncm91cC5oIHwgMTkgKysrKy0tLS0tLS0tLS0tLS0tLQog
c2VjdXJpdHkvZGV2aWNlX2Nncm91cC5jICAgICAgfCAxNSArKysrKysrKysrKysrLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9kZXZpY2VfY2dyb3VwLmggYi9pbmNsdWRlL2xpbnV4L2RldmljZV9j
Z3JvdXAuaAppbmRleCA4NTU3ZWZlMDk2ZGMuLmZhMzViNTJlMDAwMiAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9saW51eC9kZXZpY2VfY2dyb3VwLmgKKysrIGIvaW5jbHVkZS9saW51eC9kZXZpY2VfY2dy
b3VwLmgKQEAgLTEyLDI2ICsxMiwxNSBAQAogI2RlZmluZSBERVZDR19ERVZfQUxMICAgNCAgLyog
dGhpcyByZXByZXNlbnRzIGFsbCBkZXZpY2VzICovCiAKICNpZmRlZiBDT05GSUdfQ0dST1VQX0RF
VklDRQotZXh0ZXJuIGludCBfX2RldmNncm91cF9jaGVja19wZXJtaXNzaW9uKHNob3J0IHR5cGUs
IHUzMiBtYWpvciwgdTMyIG1pbm9yLAotCQkJCQlzaG9ydCBhY2Nlc3MpOworaW50IGRldmNncm91
cF9jaGVja19wZXJtaXNzaW9uKHNob3J0IHR5cGUsIHUzMiBtYWpvciwgdTMyIG1pbm9yLAorCQkJ
ICAgICAgIHNob3J0IGFjY2Vzcyk7CiAjZWxzZQotc3RhdGljIGlubGluZSBpbnQgX19kZXZjZ3Jv
dXBfY2hlY2tfcGVybWlzc2lvbihzaG9ydCB0eXBlLCB1MzIgbWFqb3IsIHUzMiBtaW5vciwKLQkJ
CQkJICAgICAgIHNob3J0IGFjY2VzcykKK3N0YXRpYyBpbmxpbmUgaW50IGRldmNncm91cF9jaGVj
a19wZXJtaXNzaW9uKHNob3J0IHR5cGUsIHUzMiBtYWpvciwgdTMyIG1pbm9yLAorCQkJCQkgICAg
IHNob3J0IGFjY2VzcykKIHsgcmV0dXJuIDA7IH0KICNlbmRpZgogCiAjaWYgZGVmaW5lZChDT05G
SUdfQ0dST1VQX0RFVklDRSkgfHwgZGVmaW5lZChDT05GSUdfQ0dST1VQX0JQRikKLXN0YXRpYyBp
bmxpbmUgaW50IGRldmNncm91cF9jaGVja19wZXJtaXNzaW9uKHNob3J0IHR5cGUsIHUzMiBtYWpv
ciwgdTMyIG1pbm9yLAotCQkJCQkgICAgIHNob3J0IGFjY2VzcykKLXsKLQlpbnQgcmMgPSBCUEZf
Q0dST1VQX1JVTl9QUk9HX0RFVklDRV9DR1JPVVAodHlwZSwgbWFqb3IsIG1pbm9yLCBhY2Nlc3Mp
OwotCi0JaWYgKHJjKQotCQlyZXR1cm4gLUVQRVJNOwotCi0JcmV0dXJuIF9fZGV2Y2dyb3VwX2No
ZWNrX3Blcm1pc3Npb24odHlwZSwgbWFqb3IsIG1pbm9yLCBhY2Nlc3MpOwotfQotCiBzdGF0aWMg
aW5saW5lIGludCBkZXZjZ3JvdXBfaW5vZGVfcGVybWlzc2lvbihzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBpbnQgbWFzaykKIHsKIAlzaG9ydCB0eXBlLCBhY2Nlc3MgPSAwOwpkaWZmIC0tZ2l0IGEvc2Vj
dXJpdHkvZGV2aWNlX2Nncm91cC5jIGIvc2VjdXJpdHkvZGV2aWNlX2Nncm91cC5jCmluZGV4IGRj
Mjg5MTRmYTcyZS4uMDRkZDI5YmY3ZjA2IDEwMDY0NAotLS0gYS9zZWN1cml0eS9kZXZpY2VfY2dy
b3VwLmMKKysrIGIvc2VjdXJpdHkvZGV2aWNlX2Nncm91cC5jCkBAIC04MDEsOCArODAxLDggQEAg
c3RydWN0IGNncm91cF9zdWJzeXMgZGV2aWNlc19jZ3JwX3N1YnN5cyA9IHsKICAqCiAgKiByZXR1
cm5zIDAgb24gc3VjY2VzcywgLUVQRVJNIGNhc2UgdGhlIG9wZXJhdGlvbiBpcyBub3QgcGVybWl0
dGVkCiAgKi8KLWludCBfX2RldmNncm91cF9jaGVja19wZXJtaXNzaW9uKHNob3J0IHR5cGUsIHUz
MiBtYWpvciwgdTMyIG1pbm9yLAotCQkJCSBzaG9ydCBhY2Nlc3MpCitzdGF0aWMgaW50IF9fZGV2
Y2dyb3VwX2NoZWNrX3Blcm1pc3Npb24oc2hvcnQgdHlwZSwgdTMyIG1ham9yLCB1MzIgbWlub3Is
CisJCQkJCXNob3J0IGFjY2VzcykKIHsKIAlzdHJ1Y3QgZGV2X2Nncm91cCAqZGV2X2Nncm91cDsK
IAlib29sIHJjOwpAQCAtODI0LDMgKzgyNCwxNCBAQCBpbnQgX19kZXZjZ3JvdXBfY2hlY2tfcGVy
bWlzc2lvbihzaG9ydCB0eXBlLCB1MzIgbWFqb3IsIHUzMiBtaW5vciwKIAogCXJldHVybiAwOwog
fQorCitpbnQgZGV2Y2dyb3VwX2NoZWNrX3Blcm1pc3Npb24oc2hvcnQgdHlwZSwgdTMyIG1ham9y
LCB1MzIgbWlub3IsIHNob3J0IGFjY2VzcykKK3sKKwlpbnQgcmMgPSBCUEZfQ0dST1VQX1JVTl9Q
Uk9HX0RFVklDRV9DR1JPVVAodHlwZSwgbWFqb3IsIG1pbm9yLCBhY2Nlc3MpOworCisJaWYgKHJj
KQorCQlyZXR1cm4gLUVQRVJNOworCisJcmV0dXJuIF9fZGV2Y2dyb3VwX2NoZWNrX3Blcm1pc3Np
b24odHlwZSwgbWFqb3IsIG1pbm9yLCBhY2Nlc3MpOworfQorRVhQT1JUX1NZTUJPTChkZXZjZ3Jv
dXBfY2hlY2tfcGVybWlzc2lvbik7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
