Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A89815F3
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 11:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646D088DA9;
	Mon,  5 Aug 2019 09:54:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800058.outbound.protection.outlook.com [40.107.80.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F9888DA9
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 09:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/7E+5+j4TQqgyntl1A7T/s8SRFMhdb/eGNA8P/1VcBY8VK6EqLNw8i3jkI2rkKQbdrmQzB0JSmQHSkmiNSomgQy2Kicnpw9ZfnDx6VTbZwVsqQuC/nNMyJ0I74RT4AyHsITh3WwrwGcRTiWeZzbGxAZNHSWUFdKxX50u6mjd4sdUxdae/9qGxBTA8QyBPPcNJYCA0tHM/rcFCleacGwJYDHeTATrZz2UKvCK6UXCWMoBnWg+XzuheetbQovJ3oz1KYNuRVCJu85KQt18/Ctm9cGZ+kuKG1BkOeIHT2rR4GylA591BpJX6qg4eVljGta8X6c8SElFLonrUEZI3E7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/7dS5kvORsJuCL6pUmLwl3VNTkwbrigCFqeZI6YkvQ=;
 b=Qxlm728KLXteORe0kF/BbycoYDM33C9w9kdTyOO0ausWIM5pTGgRMaxSiHjn/UBa93E9ArGyRO7z2ve61I8Ew51HTZqVp/nVLGbo7Ljx1s2nrXDnx7p/UzPQsO12mhiIUg3NRDsz29mhydusfMW/YaR43WExR5vz8tzqRIHNHzL56jvoNJCJP1/dqnUI2jNgFU6JxoCtSUitu8ws71LjotHt3kuyVNd9KbkbqaBqTijYBPBm2zUkpx+zgalRWOoGZz4xMBFspd3hTwoe3POfGWgooU9lSywFaLZxTKP9fOTssex6CbL9fgckO6xTPWq5FAKK+xnEqYzSK2D53BExQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3474.namprd12.prod.outlook.com (20.178.211.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 09:54:22 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 09:54:22 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/soc15: fix external_rev_id for navi14
Thread-Topic: [PATCH] drm/amdgpu/soc15: fix external_rev_id for navi14
Thread-Index: AQHVS3EkZB1hRDv5rkWDykw7theYfqbsUIe1
Date: Mon, 5 Aug 2019 09:54:21 +0000
Message-ID: <BN8PR12MB3602FF5FB4F62792F51FD43C89DA0@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <1564997723-3737-1-git-send-email-tianci.yin@amd.com>
In-Reply-To: <1564997723-3737-1-git-send-email-tianci.yin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61cb24ef-f7aa-4c96-734e-08d7198ae428
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3474; 
x-ms-traffictypediagnostic: BN8PR12MB3474:
x-microsoft-antispam-prvs: <BN8PR12MB3474D5527EA246B93E25D57C89DA0@BN8PR12MB3474.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(71200400001)(305945005)(74316002)(7736002)(81166006)(71190400001)(81156014)(6116002)(2906002)(110136005)(54906003)(3846002)(86362001)(55016002)(2501003)(11346002)(66946007)(486006)(76116006)(64756008)(66556008)(6436002)(8676002)(8936002)(446003)(229853002)(66446008)(316002)(476003)(5660300002)(76176011)(68736007)(9686003)(26005)(4744005)(33656002)(53936002)(66476007)(99286004)(91956017)(53546011)(102836004)(52536014)(6506007)(7696005)(478600001)(4326008)(25786009)(14454004)(186003)(6246003)(256004)(66066001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3474;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PK3h1SD0q87gWWA5xZlFsqWsAXzpcbK9wGVrxOoVXX0NCpukP9rw8kilGj0JI04t484/F5V9QyX8JFJVNyNNMf+6hzqEBcxZL7cCEFu5H1GdMRiVS+xdAvXM6/mVdGZzPusV97xq1xCvZqzGmmkkUFxqe4TwsO9HiRnJ0FL2XExWA/TX6haL/J+26yJQ9CbYUs6sWEVEvRBMk0+dFXGwKSe4EqwMClem7YoncWn7mlYsmaKwFNaXprHu53JBgIdb3LkSIu/Dn4VqjTggJNXQBiEjWQwHo0YUa8dXq3GfQK7nWk9TsC9U4wKK59pG8Z8AcMnLsmLuIt6H5FWPFzS72IGbVWtm/hr38YAmojK6bJL+1NI66bpPoq4dOxDoECDRo1wEMFlQeKhVdCno0Eilde0t7TF5fhxoBwFAy1Soizw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cb24ef-f7aa-4c96-734e-08d7198ae428
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:54:21.8862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3474
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/7dS5kvORsJuCL6pUmLwl3VNTkwbrigCFqeZI6YkvQ=;
 b=jgK3NP17AZnztlLjoqxYCB6jLMseRv0Z1xSGkSbxd1tpMp1i+MoOdplm5Kiv/nIRw9zpsWtdLxDjEH1954IE5DXaUdpJPoTFnYSH/pfRCbrnKRY0EyBHV1BjoJxnEYVvJpX91i3vEYbj4oSM2Is3BmhoRdJ4FwyzQnEhJdBRLrQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpCUiwKWGlh
b2ppZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBUaWFu
Y2kgWWluIDx0aWFuY2kueWluQGFtZC5jb20+ClNlbnQ6IE1vbmRheSwgQXVndXN0IDUsIDIwMTkg
NTozNSBQTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IFpoYW5nLCBIYXdr
aW5nOyBYaWFvLCBKYWNrOyBZdWFuLCBYaWFvamllOyBZaW4sIFRpYW5jaSAoUmljbykKU3ViamVj
dDogW1BBVENIXSBkcm0vYW1kZ3B1L3NvYzE1OiBmaXggZXh0ZXJuYWxfcmV2X2lkIGZvciBuYXZp
MTQKCkZyb206IHRpYW5jeWluIDx0aWFuY2kueWluQGFtZC5jb20+CgpmaXggdGhlIGhhcmQgY29k
ZSBleHRlcm5hbF9yZXZfaWQuCgpDaGFuZ2UtSWQ6IEk3YjQ2ZjdiNDliNmQwNTg2ZDFmYTI4MmQ0
OTYxODE1ZmIxMjQzNzliClNpZ25lZC1vZmYtYnk6IHRpYW5jeWluIDx0aWFuY2kueWluQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9u
di5jCmluZGV4IDliY2U2YTEuLjJmNDViZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwpAQCAt
NTQ2LDcgKzU0Niw3IEBAIHN0YXRpYyBpbnQgbnZfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFu
ZGxlKQogICAgICAgICAgICAgICAgICAgICAgICBBTURfQ0dfU1VQUE9SVF9CSUZfTFM7CiAgICAg
ICAgICAgICAgICBhZGV2LT5wZ19mbGFncyA9IEFNRF9QR19TVVBQT1JUX1ZDTiB8CiAgICAgICAg
ICAgICAgICAgICAgICAgIEFNRF9QR19TVVBQT1JUX1ZDTl9EUEc7Ci0gICAgICAgICAgICAgICBh
ZGV2LT5leHRlcm5hbF9yZXZfaWQgPSAyMDsKKyAgICAgICAgICAgICAgIGFkZXYtPmV4dGVybmFs
X3Jldl9pZCA9IGFkZXYtPnJldl9pZCArIDIwOwogICAgICAgICAgICAgICAgYnJlYWs7CiAgICAg
ICAgZGVmYXVsdDoKICAgICAgICAgICAgICAgIC8qIEZJWE1FOiBub3Qgc3VwcG9ydGVkIHlldCAq
LwotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
