Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2050A8631
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD2A89C21;
	Wed,  4 Sep 2019 15:48:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810042.outbound.protection.outlook.com [40.107.81.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1333F89C09
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:48:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2tiGb/E55Lep5R/JREpcK3nXeC6b3xHcJn97YFQDaWMEfrpVHtbwfejaFb+cClSZ38FF051D+FAaWZ9XHzdEaYuBCWbZbJk0XvqgS7nahud8DJ24dTMQgPAplRjPjfvcguEOR+q4icv4gxbWr0hfOfhZBhT59qksXvFSmcUeVTmp3swL1cJTPot9eyiRlaIHl+43cUD+crIcjoSIyL0PDC/+FbRX+0+npDpx+EWs3Td272arkUF3lDsvZ0hqVDYnfkK9NE6KkRwXwWk5jxOgfC1GF+C2MStZnPDbCd+AbNk+QvrAkUG8X6MiJ4w0Wpy583dge5aSXz+nm3aQO8N7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCMo8l0aNjnSYonVqPIHj8XhYMHv6yDGJ9j9sUncce4=;
 b=hTn6han2QKOivFOvkTiQkUUq5yj3j8w8OekXEE0zSpZ70qxQIyIFB5svMCWKB2q7APelH+YF0qf2ZEK9sPfeEtnwh7HVFYPzZkXDljWCYaWWQy7rcE3DVUykmC0siRRj3ZE+RMlIloRkLge9GwmVmyjFsZsaLRDVFpq91CevwWAGlOKvaNx3K0NKk0jaxgI2mZLm8qtj8CF/qHAy/FzZ8LCnDcUu2OPtZFor/DHQQqZPE90VoKxiyBtZ+n4VVAlNOaBxxlAMY2yozFAYIpL6G4NA26IqOxblLZcuS/SoT2Lq9bNu0coqDU0U0OM6ofVqkmBmaHeJiqsEIkOexp2xqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2863.namprd12.prod.outlook.com (20.179.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 15:48:33 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 15:48:33 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/10] drm/amdkfd: enable renoir while device probes
Thread-Topic: [PATCH 10/10] drm/amdkfd: enable renoir while device probes
Thread-Index: AQHVYzg0xJ4wdHM7zUiKq+HB9Tq4MA==
Date: Wed, 4 Sep 2019 15:48:32 +0000
Message-ID: <20190904154803.5102-11-ray.huang@amd.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
In-Reply-To: <20190904154803.5102-1-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34b95894-7014-4f13-3fd2-08d7314f56f5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2863; 
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2863817AE3AEAAEDEB25C4C4ECB80@MN2PR12MB2863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(66446008)(99286004)(64756008)(305945005)(66556008)(66476007)(66946007)(6436002)(5640700003)(86362001)(7736002)(3846002)(6116002)(486006)(256004)(6916009)(5660300002)(8676002)(2351001)(4326008)(6506007)(386003)(14454004)(316002)(54906003)(6486002)(11346002)(76176011)(478600001)(446003)(53936002)(52116002)(26005)(71190400001)(71200400001)(102836004)(66066001)(1076003)(186003)(36756003)(8936002)(25786009)(4744005)(50226002)(81156014)(2501003)(81166006)(6512007)(2616005)(476003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2863;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l2GvcBXMREBPSZ5Lma35FH5hlVyUWaeKpPiAbyJ6Ew0JcuBWu1ZuM7jxMJqcnet/GePIvYqtWGR5EflsPPY3TMHU25SY6G64NfzxJV9cvBj+O5QQZqLrqYt8X+9QtwiYHil5GxCofUvdqufmVtBUx73eUVDDNhgRFgHEPD6WqS9qfkWyk1yCfjc4g9ecXyw6ULeRnr1VBjMYkePWh3rFCg4jTTSjYnu/O9nP7X3ZcjJG1yQl8gqMBpikS0ysxYNi6jvFjPE5+tBnimw/5a1Du55w6vuRqAKB4m2GoSavh57wloaTE2HHxFxlvqbYVBH8v1x4sH8e8++rZN4VeeKFPmIRV00mlmt0OMaajOznubP0LZxXbtREXUqIzsoM3ZFag2NT3HH7P9Hm/gIxNxSBY11eeZGmIeXl1Z74OF25m18=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b95894-7014-4f13-3fd2-08d7314f56f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:48:32.9563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZazsNHgy4eBxHrchuW8fdbwkddhnNeaPttxi3ZDoxD7cUa/sGDbjJXCrWlgoL+OLDmEmvFMeTJfDSEYSMAJtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCMo8l0aNjnSYonVqPIHj8XhYMHv6yDGJ9j9sUncce4=;
 b=wsdufWY1vtptHss1Z8AVMZahAqj8jQpvqZKeJk+9QmC+vXkLhd3fC3lPpWp8+15QjqUlUGPHsnudPUMj3oJ6+3C1jhm6MUnLKpO2npwFWMVHLH9cucgDlQbNzLw8p4Gywlmp7AKe1XiJpsAHaNZFMwqlEx3goAACriJatAcchZs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyB0byBhZGQgYXNpYyBmbGFnIHRvIGVuYWJsZSBkZXZpY2UgcHJvYmUgZHVy
aW5nIGtmZCBpbml0LgoKU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMgfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmQuYwppbmRleCAzZGZkOWRlLi41MTY4N2FmOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYwpAQCAtOTAsNiArOTAsNyBAQCB2b2lk
IGFtZGdwdV9hbWRrZmRfZGV2aWNlX3Byb2JlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
CWNhc2UgQ0hJUF9WRUdBMTI6CiAJY2FzZSBDSElQX1ZFR0EyMDoKIAljYXNlIENISVBfUkFWRU46
CisJY2FzZSBDSElQX1JFTk9JUjoKICNpZiBMSU5VWF9WRVJTSU9OX0NPREUgPCBLRVJORUxfVkVS
U0lPTig0LCAxNiwgMCkgJiYgZGVmaW5lZChCVUlMRF9BU19ES01TKQogCQlpZiAoYWRldi0+YXNp
Y190eXBlID09IENISVBfUkFWRU4pIHsKIAkJCWRldl9kYmcoYWRldi0+ZGV2LCAiREtNUyBpbnN0
YWxsZWQga2ZkIGRvZXMgbm90IHN1cHBvcnQgUmF2ZW4gZm9yIGtlcm5lbCA8IDQuMTZcbiIpOwot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
