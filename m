Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29B4A5E52
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 02:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E188991E;
	Tue,  3 Sep 2019 00:01:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800053.outbound.protection.outlook.com [40.107.80.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E808991E
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 00:01:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6yMTox0DLupYyhsB1S6af6kuxiiEHjLyqFUCXeqNkiM663FJz9HfrT8SGm/KSCkTHTFNSu9U3NcFY2KXJAmz4qopqPu8TE0xxHB6pz0QEO4PQvtbhr+B7bN9tZqdwAcFwA5r9uE03Itqe7XlghTKcz1o2UYOy7q7qRCc5qhfzuvj0U57uZmbABZp60CMls0XehAcTGxTIjm8KFS0WcLPVKH8hGoOlaufry5J61OxJXulDZSytdnkdcfs8Mg2XQ0jS8LlrDCyuiI/Ydxmqge9Hi38zeWs0RerJB+K1vzLSv5vyTwNibo8DKcKeqhV67q5nFT7fUEV7P2H48kvgN/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfLjl/DDHoxzJvWrap3+43/0qGn3YlstC3s4omB7Y/k=;
 b=GuGodDzy7g2kPAKVgEHtod4lam14C9WR+EyItrzHVnu5dsv6rLqz+q2smRwErhYp08SFwceUvimoFQ7oNUoKIgBtf5UjZTg0r3T2IrlBp0e6FB0TZENEmh8AGhzJ9wUYaPSWEZBjQupWgowBvWWBmoBSuIUnfTWkRvAFWX/+iEH/so6RiO9H8uDCSV46vNM5B5asZ67YpEtctP0TzDx1sngQJz0nzbfYI4jrRiA8fOC+DV07EYOVudZ+0sc8goZl/rveeZ9jQwshp4mgLbwsso0dVh9d1dVZ4+KuyHFxu+Yy2KqZa/zf4E+aW0r1gPj0pYEIJKgflEmGhEGVK6QqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1818.namprd12.prod.outlook.com (10.175.92.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 3 Sep 2019 00:01:49 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 00:01:43 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 01/10] drm/amdgpu: set ip specific ras interface pointer to
 NULL after free it
Thread-Topic: [PATCH 01/10] drm/amdgpu: set ip specific ras interface pointer
 to NULL after free it
Thread-Index: AQHVYerEDDbCWdC5u06uAX0gtHgPmA==
Date: Tue, 3 Sep 2019 00:01:43 +0000
Message-ID: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::34) To DM5PR12MB1418.namprd12.prod.outlook.com
 (2603:10b6:3:7a::15)
x-originating-ip: [180.167.199.189]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b1852c3-9a30-4e0b-4b61-08d73001e721
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1818; 
x-ms-traffictypediagnostic: DM5PR12MB1818:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1818478A5F5CBB63422C332DFCB90@DM5PR12MB1818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:534;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(99286004)(66446008)(36756003)(2501003)(478600001)(316002)(256004)(66946007)(14444005)(5660300002)(66476007)(53936002)(81166006)(26005)(8676002)(71200400001)(102836004)(81156014)(71190400001)(6486002)(66556008)(50226002)(186003)(8936002)(66066001)(25786009)(3846002)(6116002)(6512007)(6506007)(386003)(4326008)(86362001)(486006)(2616005)(305945005)(52116002)(7736002)(476003)(110136005)(2906002)(14454004)(6636002)(64756008)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1818;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nQcUqsG9M9NoN5KMguTApDmjSBK7mnNwmk2OUX60EdrHv0OzmLRKqiuh14HKRTgCrJUegYFS+J9kG8TbatLgwPdJR8Id4UqjwA4mlLQyoFR/qBY487GLTe/y0693WtT9VkzDdnCoIWtsMtUTqahD+6CHfSBnUoojxTpubwYHyCBXPHSVS8H/rMxwqkv6rEhPJ6LuveHIScFdlpg+34To3nD68Qm53FpgDg6bCuQu17O8YjjmkWNdbnt5ez9rz8pEmk/L5D9trHvVzS/WN2N+ZFZkQ1ETLkoCUFzIG1jVrOQNUODN4Bkz1HQuYhmCfKnfEdyA8CmX83CSIeCzgU7DlBjx1kGjpeTcKr6Gp03YOXw8rxZkZPAqNaB/R1k9NrqxMXBmcClllPhq0Ers5+NlDPKWx1tpiG2AjJCu2KqPQsk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1852c3-9a30-4e0b-4b61-08d73001e721
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 00:01:43.1222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BBPqUll5uWvtJdKCt44T/n2Eg2tEqhH/cSYtdMcdujCkHelu6ODecC+WccNu2mvk7l6/E+JxW3LqcqpL1zhxBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfLjl/DDHoxzJvWrap3+43/0qGn3YlstC3s4omB7Y/k=;
 b=TZi4eIMN6JZx9Vpw8U+uGSILZ42epdCNt1YoZhz3jwvHEefM9pNCTj5X9NOkrMb19duF6MqXSgcjF0T+z+b5tT3HYPacC4HH03oNLYLxCC2zL02+2CN7zVq8ngalVOrj3eIaWe6YCi4Ar8Za7wluYicpSgI4akEklofws7W/IL0=
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dG8gcHJldmVudCBhY2Nlc3MgdG8gZGFuZ2xpbmcgcG9pbnRlcnMKClNpZ25lZC1vZmYtYnk6IEhh
d2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgfCA3ICsrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMgICB8IDggKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L21taHViX3YxXzAuYyB8IDQgKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJp
b192N180LmMgIHwgNCArKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAu
YyAgfCA4ICsrKysrKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKaW5kZXggY2I4ZDhi
Ni4uYzkwMjg4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5
XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCkBAIC00NDMx
LDE0ICs0NDMxLDE3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpo
YW5kbGUpCiAJCXIgPSBhbWRncHVfaXJxX2dldChhZGV2LCAmYWRldi0+Z2Z4LmNwX2VjY19lcnJv
cl9pcnEsIDApOwogCQlpZiAocikKIAkJCWdvdG8gbGF0ZV9maW5pOwotCX0gZWxzZQotCQlrZnJl
ZShhZGV2LT5nZngucmFzX2lmKTsKKwl9IGVsc2UgeworCQlyID0gMDsKKwkJZ290byBmcmVlOwor
CX0KIAogCXJldHVybiAwOwogbGF0ZV9maW5pOgogCWFtZGdwdV9yYXNfbGF0ZV9maW5pKGFkZXYs
IGFkZXYtPmdmeC5yYXNfaWYsICZpaF9pbmZvKTsKIGZyZWU6CiAJa2ZyZWUoYWRldi0+Z2Z4LnJh
c19pZik7CisJYWRldi0+Z2Z4LnJhc19pZiA9IE5VTEw7CiAJcmV0dXJuIHI7CiB9CiAKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IGFmMDY5YTQuLjc0NDgzYTcgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpAQCAtNzkzLDggKzc5MywxMSBAQCBzdGF0
aWMgaW50IGdtY192OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQogCQlyID0gYW1kZ3B1
X2lycV9nZXQoYWRldiwgJmFkZXYtPmdtYy5lY2NfaXJxLCAwKTsKIAkJaWYgKHIpCiAJCQlnb3Rv
IHVtY19sYXRlX2Zpbmk7Ci0JfSBlbHNlCi0JCWtmcmVlKGFkZXYtPmdtYy51bWNfcmFzX2lmKTsK
Kwl9IGVsc2UgeworCQkvKiBmcmVlIHVtYyByYXNfaWYgaWYgdW1jIHJhcyBpcyBub3Qgc3VwcG9y
dGVkICovCisJCXIgPSAwOworCQlnb3RvIGZyZWU7CisJfQogCiAJaWYgKGFkZXYtPm1taHViX2Z1
bmNzICYmIGFkZXYtPm1taHViX2Z1bmNzLT5yYXNfbGF0ZV9pbml0KSB7CiAJCXIgPSBhZGV2LT5t
bWh1Yl9mdW5jcy0+cmFzX2xhdGVfaW5pdChhZGV2KTsKQEAgLTgwNiw2ICs4MDksNyBAQCBzdGF0
aWMgaW50IGdtY192OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQogCWFtZGdwdV9yYXNf
bGF0ZV9maW5pKGFkZXYsIGFkZXYtPmdtYy51bWNfcmFzX2lmLCAmdW1jX2loX2luZm8pOwogZnJl
ZToKIAlrZnJlZShhZGV2LT5nbWMudW1jX3Jhc19pZik7CisJYWRldi0+Z21jLnVtY19yYXNfaWYg
PSBOVUxMOwogCXJldHVybiByOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9tbWh1Yl92MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92
MV8wLmMKaW5kZXggYWI2NTU5YS4uOTkxNmEzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbW1odWJfdjFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L21taHViX3YxXzAuYwpAQCAtNjM5LDggKzYzOSwxMCBAQCBzdGF0aWMgaW50IG1taHViX3YxXzBf
cmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAltbWh1Yl9paF9pbmZv
LmhlYWQgPSBtbWh1Yl9mc19pbmZvLmhlYWQgPSAqYWRldi0+Z21jLm1taHViX3Jhc19pZjsKIAly
ID0gYW1kZ3B1X3Jhc19sYXRlX2luaXQoYWRldiwgYWRldi0+Z21jLm1taHViX3Jhc19pZiwKIAkJ
CQkgJm1taHViX2ZzX2luZm8sICZtbWh1Yl9paF9pbmZvKTsKLQlpZiAociB8fCAhYW1kZ3B1X3Jh
c19pc19zdXBwb3J0ZWQoYWRldiwgYWRldi0+Z21jLm1taHViX3Jhc19pZi0+YmxvY2spKQorCWlm
IChyIHx8ICFhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBhZGV2LT5nbWMubW1odWJfcmFz
X2lmLT5ibG9jaykpIHsKIAkJa2ZyZWUoYWRldi0+Z21jLm1taHViX3Jhc19pZik7CisJCWFkZXYt
PmdtYy5tbWh1Yl9yYXNfaWYgPSBOVUxMOworCX0KIAlyZXR1cm4gcjsKIH0KIApkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYwppbmRleCA1ZTc4NGJiLi43NmMwMDI5IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYwpAQCAtNTAyLDYgKzUwMiw5IEBAIHN0YXRp
YyBpbnQgbmJpb192N180X3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJCXIgPSBhbWRncHVfaXJxX2dldChhZGV2LCAmYWRldi0+bmJpby5yYXNfZXJyX2V2ZW50X2F0
aHViX2lycSwgMCk7CiAJCWlmIChyKQogCQkJZ290byBsYXRlX2Zpbmk7CisJfSBlbHNlIHsKKwkJ
ciA9IDA7CisJCWdvdG8gZnJlZTsKIAl9CiAKIAlyZXR1cm4gMDsKQEAgLTUwOSw2ICs1MTIsNyBA
QCBzdGF0aWMgaW50IG5iaW9fdjdfNF9yYXNfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCWFtZGdwdV9yYXNfbGF0ZV9maW5pKGFkZXYsIGFkZXYtPm5iaW8ucmFzX2lmLCAm
aWhfaW5mbyk7CiBmcmVlOgogCWtmcmVlKGFkZXYtPm5iaW8ucmFzX2lmKTsKKwlhZGV2LT5uYmlv
LnJhc19pZiA9IE5VTEw7CiAJcmV0dXJuIHI7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c2RtYV92NF8wLmMKaW5kZXggZGYyZmIxZi4uZTk3MWU4NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NF8wLmMKQEAgLTE3MjUsMTQgKzE3MjUsMTggQEAgc3RhdGljIGludCBzZG1h
X3Y0XzBfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJCWlmIChyKQogCQkJCWdvdG8gbGF0ZV9m
aW5pOwogCQl9Ci0JfSBlbHNlCi0JCWtmcmVlKGFkZXYtPnNkbWEucmFzX2lmKTsKKwl9IGVsc2Ug
eworCQkvKiBmcmVlIHNkbWEgcmFzX2lmIGlmIHNkbWEgcmFzIGlzIG5vdCBzdXBwb3J0ZWQgKi8K
KwkJciA9IDA7CisJCWdvdG8gZnJlZTsKKwl9CiAKICAgICAgICAgcmV0dXJuIDA7CiBsYXRlX2Zp
bmk6CiAJYW1kZ3B1X3Jhc19sYXRlX2ZpbmkoYWRldiwgYWRldi0+c2RtYS5yYXNfaWYsICZpaF9p
bmZvKTsKIGZyZWU6CiAJa2ZyZWUoYWRldi0+c2RtYS5yYXNfaWYpOworCWFkZXYtPnNkbWEucmFz
X2lmID0gTlVMTDsKIAlyZXR1cm4gcjsKIH0KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
