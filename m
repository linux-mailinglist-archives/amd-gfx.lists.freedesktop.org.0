Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB0124058A
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Aug 2020 14:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7774989930;
	Mon, 10 Aug 2020 12:05:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E42689930
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Aug 2020 12:05:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHIB+hInq8HLACq1x9SmwFPxqQvnzkWYUYI+Se0CAg8PpUc4pG4mdzkbaUs9dgmniF+zDHmHvTdZjBWsEJeg/pi2TVGb23PvvwsxsBOxii+upmaqmTRwsXD4BekcT9KUcJ2SzHrv50WHtE8yII9o6/IuS85lbVHJ2jCH9vUzTJKHdxj/0k4G9rhCFc6Od7k9ZviBr9Kt680KHi2N78IGoZqq/ew5BJXndyhMwXxQCz6oVw0U6Pp9tW+XcLgMzjSUCGJQQbM7AVITTwUOzIOsCqDMsCF716Wt8YIq+CfTvXOofA2QZvU7XdgbRAiWVm0ikJH7Ryp61JUWhnhZTrxLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9618yp6t5AIT8DNLPvYyflqXAmCCY783XXJmohR6Bns=;
 b=fu/TeKD8vv4+IcaeWQ9W+XE6UVFBGtb+zC1rHDwFUlISCRKD0jHNLDtMIMc1leBt0gsWbsAauFGfKaT5k/nntKFXHk7bf22JGtyyhm6mpiDeL0uqDc6f+3XM3PJ3ijbnlDAUcCjyMjfr+KaZnWtXV8cP1ziONGd4E4xFqvZSmPdYoeaiGiehCyj9iBNF+HEmUxv/gity48UmoONsIR5j2Z6HHCyQ/B0n78McfBH6pi/Aq3TZpkxAUsQSwj6Uxprx/+emj61WuMzQNX6oFHDb2CUJNF/Q1Q5w1iahi/rpJbzBzfp8uBXJD7nc57gjxNPfMDC4KT4HgYeNxgZq3tpFTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9618yp6t5AIT8DNLPvYyflqXAmCCY783XXJmohR6Bns=;
 b=eIbCadj/QUMcQj+mJzc1nRsUblK7JgdWLPGkmWDMH1EEHBc2bFoBbjLTxub+rDd3ZS3zg5Rr4CUVrGh1XEmsm8MyGUlT+OWM5hd6Mwpuu2WvUyU+NKrkCESLc2Gw68p00doL34LeXTJxbq/71ZkjLf4GwQ5BnN5mJvNg4JiBiT4=
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 DM6PR12MB3770.namprd12.prod.outlook.com (2603:10b6:5:1c4::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.22; Mon, 10 Aug 2020 12:05:47 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::8ce7:f7e6:39e7:641a]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::8ce7:f7e6:39e7:641a%5]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 12:05:47 +0000
From: "Wood, Wyatt" <Wyatt.Wood@amd.com>
To: Brandon Wright <bearoso@gmail.com>, "Brol, Eryk" <Eryk.Brol@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 12/15] drm/amd/display: Use hw lock mgr
Thread-Topic: [PATCH 12/15] drm/amd/display: Use hw lock mgr
Thread-Index: AQHWbfJVraHwEgZ+r0e6qUSCAwqlF6kxQSIA
Date: Mon, 10 Aug 2020 12:05:46 +0000
Message-ID: <DM5PR12MB250472246E00FEA8E5D6950D8F440@DM5PR12MB2504.namprd12.prod.outlook.com>
References: <CA+3_KcDvzjTwARb1w4d5YfW9Y99ZaxVex+G7R7SzB5SoPsYBpQ@mail.gmail.com>
In-Reply-To: <CA+3_KcDvzjTwARb1w4d5YfW9Y99ZaxVex+G7R7SzB5SoPsYBpQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2607:fea8:79f:f82e:c98e:75e6:dcf4:e996]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d2d60e25-9c66-4c5f-eac7-08d83d25b744
x-ms-traffictypediagnostic: DM6PR12MB3770:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB37708272CA47A56399157E448F440@DM6PR12MB3770.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pDRlqpzG+HxWIbOXFCDNf8+1nbqTm87mINV6vj9SiRC1+DsNNyDEGa9LrquHMiYBMuZnTs0UptLhAePJfiGkFy5RIIBM23BSXB86C5LxTON6XNTXr0QJLh/LIMSgL3q7D7Go38dIKYMpJC8ptGlAdxqGt3PT+iZvwW2fUMoR0Z9LXRb0txAZFuWV/DP1bc3JV67W/rMlOBezxGluKbMu6uIjx36bGISlzyIhEQLFtIKkrteOOP/vWpZec1byCYcG90VIZcABi6WLrH8ICrxqDWBMHiKbU569O2VYs2DWxbtJoy/+qysvs3IQrBOLOYqhgfNSNGewJLg4mASQudabcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2504.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(110136005)(7696005)(186003)(316002)(71200400001)(83380400001)(6506007)(53546011)(478600001)(9686003)(8676002)(52536014)(2906002)(86362001)(5660300002)(76116006)(64756008)(66556008)(66446008)(66476007)(66946007)(55016002)(33656002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: NM0ynkHbRyJCf8MPFm0NKaUjXioLz7OL5aqnbf4/bz96uAQRDJe7zOkbfUZk8OpbmkVm5fdD8VOHHKZ6DVGhypb+pfNkWu2OC2As1UwzaMI62Gn9xLQCzFVWsTOQZwuGH+RrROnyquRxtQk79K85zbgn8oupWBlwi1EkYi3F7HudZCnm7E2TnFPUOV+iinbazJ9uL5wWniQejsP1WgQnt0A9uVXgIthodR54VkVyf/KQuYk7L0DbG8Xx9ExTTPXr+5qxyhxpWeoEitl1kETYs8/Vp4NXViI56AwL+HryiyT3RWKJ/5c7lsBaM81iQMmAQD2zq4tQ1d7qoxD9NesCt37M4ssQ8FxCy5ruxi3xPXQLWg1xDijxCP3I191qmcqfTNe3ZYMlYGyZQ72YjACu9cM5Z3x3mt9JI4RZNATi0TxeTXH7IvopRHjMWpM8CDcg6dkbZgUwK/Q5DTs5LN8ZlDhRwgSp+2UVk9lz3S04fZkmbEC/4ivI0sZGm9qkQ9/ppUggI73RClGtVhHtWOicSONRTSC+SeJU7B01dP1XzPY2sx1lF1SSkfPS8s1fQ7fJi6HDWzxJDgejTEZyZBCGugCmX4liS8pVuAYPn4CVi7OFXWphHfZVqLVwR9dX3OFqWB5a6Qx90qNAJEAPeaScbRr4+pLL+sHGSbbuocvXWQPgP/Kc8LMYN0saaweFbn30CuUfARe3vQHN6L+x+8htEw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d60e25-9c66-4c5f-eac7-08d83d25b744
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2020 12:05:46.8837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6+QqJaLYJKc4X+NVMq66jKiKLU/TZIb1+7+soC/ndmeVfVoyn1DqcQwn5mN8Odl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3770
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1787222845=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1787222845==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB250472246E00FEA8E5D6950D8F440DM5PR12MB2504namp_"

--_000_DM5PR12MB250472246E00FEA8E5D6950D8F440DM5PR12MB2504namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGNvbmRpdGlvbiBpbiB3aGljaCBpdOKAmXMgZW5hYmxlZCBpcyBoaWRkZW4gZnJvbSB1cHN0
cmVhbS4NCg0KRnJvbTogQnJhbmRvbiBXcmlnaHQgPGJlYXJvc29AZ21haWwuY29tPg0KU2VudDog
U2F0dXJkYXksIEF1Z3VzdCA4LCAyMDIwIDEwOjExIFBNDQpUbzogQnJvbCwgRXJ5ayA8RXJ5ay5C
cm9sQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgV29vZCwgV3lhdHQg
PFd5YXR0Lldvb2RAYW1kLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggMTIvMTVdIGRybS9hbWQv
ZGlzcGxheTogVXNlIGh3IGxvY2sgbWdyDQoNCkp1c3QgY3VyaW91cywgYnV0IEkgbm90aWNlZCB0
aGlzIG5ldyBsb2NrIG1hbmFnZXIgaXNuJ3QgYmVpbmcgdXNlZCBiZWNhdXNlIG9mIHRoZSBkZWZp
bml0aXZlIGZhbHNlIHJldHVybiB2YWx1ZSBpbiBkaXNwbGF5L2RjL2RjZS9kbXViX2h3X2xvY2tf
bWdyLmM6c2hvdWxkX3VzZV9kbXViX2xvY2suDQpXYXMgdGhpcyBzdXBwb3NlZCB0byBiZSBlbmFi
bGVkPw0KDQoNCkZyb206IFd5YXR0IFdvb2QgPHd5YXR0LncuLi5AYW1kLmNvbTxtYWlsdG86d3lh
dHQudy4uLkBhbWQuY29tPj4NCg0KDQoNCltXaHldDQoNCkZlYXR1cmUgcmVxdWlyZXMgc3luY2hy
b25pemF0aW9uIG9mIGRpZywgcGlwZSwgYW5kIGN1cnNvciBsb2NraW5nDQoNCmJldHdlZW4gZHJp
dmVyIGFuZCBmdy4NCg0KW0hvd10NCg0KU2V0IGZsYWcgdG8gZm9yY2UgcHNyIHRvIHVzZSBodyBs
b2NrIG1nci4NCg0KDQoNClNpZ25lZC1vZmYtYnk6IFd5YXR0IFdvb2QgPHd5YXR0LncuLi5AYW1k
LmNvbTxtYWlsdG86d3lhdHQudy4uLkBhbWQuY29tPj4NCg0KUmV2aWV3ZWQtYnk6IEFudGhvbnkg
S29vIDxhbnRob255Li4uLkBhbWQuY29tPG1haWx0bzphbnRob255Li4uLkBhbWQuY29tPj4NCg0K
QWNrZWQtYnk6IEVyeWsgQnJvbCA8ZXJ5ay5iLi4uQGFtZC5jb208bWFpbHRvOmVyeWsuYi4uLkBh
bWQuY29tPj4NCg0KLS0tDQoNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2Rt
dWJfcHNyLmMgfCAyICstDQoNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCg0KDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RtdWJfcHNyLmMNCg0KYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
L2RtdWJfcHNyLmMNCg0KaW5kZXggODJlNjdiZDgxZjJkLi41MTY3ZDZiOGE0OGQgMTAwNjQ0DQoN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZG11Yl9wc3IuYw0KDQor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RtdWJfcHNyLmMNCg0KQEAg
LTIzMyw4ICsyMzMsOCBAQCBzdGF0aWMgYm9vbCBkbXViX3Bzcl9jb3B5X3NldHRpbmdzKHN0cnVj
dCBkbXViX3BzciAqZG11YiwNCg0KICAgICAgICBjb3B5X3NldHRpbmdzX2RhdGEtPmZyYW1lX2Nh
cF9pbmQgICAgICAgICAgICAgICAgICAgICAgID0NCg0KcHNyX2NvbnRleHQtPnBzckZyYW1lQ2Fw
dHVyZUluZGljYXRpb25SZXE7DQoNCiAgICAgICAgY29weV9zZXR0aW5nc19kYXRhLT5kZWJ1Zy5i
aXRmaWVsZHMudmlzdWFsX2NvbmZpcm0gICAgICA9DQoNCmRjLT5kYy0+ZGVidWcudmlzdWFsX2Nv
bmZpcm0gPT0gVklTVUFMX0NPTkZJUk1fUFNSID8NCg0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSA6DQoN
CmZhbHNlOw0KDQorICAgICAgIGNvcHlfc2V0dGluZ3NfZGF0YS0+ZGVidWcuYml0ZmllbGRzLnVz
ZV9od19sb2NrX21nciAgICAgPSAxOw0KDQogICAgICAgIGNvcHlfc2V0dGluZ3NfZGF0YS0+aW5p
dF9zZHBfZGVhZGxpbmUgICAgICAgICAgICAgICAgICAgPQ0KDQpwc3JfY29udGV4dC0+c2RwVHJh
bnNtaXRMaW5lTnVtRGVhZGxpbmU7DQoNCi0gICAgICAgY29weV9zZXR0aW5nc19kYXRhLT5kZWJ1
Zy5iaXRmaWVsZHMudXNlX2h3X2xvY2tfbWdyICAgICA9IDA7DQoNCg0KDQogICAgICAgIGRjX2Rt
dWJfc3J2X2NtZF9xdWV1ZShkYy0+ZG11Yl9zcnYsICZjbWQpOw0KDQogICAgICAgIGRjX2RtdWJf
c3J2X2NtZF9leGVjdXRlKGRjLT5kbXViX3Nydik7DQoNCi0tDQoNCjIuMjUuMQ0K

--_000_DM5PR12MB250472246E00FEA8E5D6950D8F440DM5PR12MB2504namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
Q291cmllcjsNCglwYW5vc2UtMToyIDcgNCA5IDIgMiA1IDIgNCA0O30NCkBmb250LWZhY2UNCgl7
Zm9udC1mYW1pbHk6IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIg
NDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1
IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDb25zb2xhczsNCglw
YW5vc2UtMToyIDExIDYgOSAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0K
cC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0K
CW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5
OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNv
LXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVy
bGluZTt9DQpwcmUNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCW1zby1zdHlsZS1saW5rOiJI
VE1MIFByZWZvcm1hdHRlZCBDaGFyIjsNCgltYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0b206LjAw
MDFwdDsNCglmb250LXNpemU6MTAuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDb3VyaWVyIE5ldyI7fQ0K
c3Bhbi5IVE1MUHJlZm9ybWF0dGVkQ2hhcg0KCXttc28tc3R5bGUtbmFtZToiSFRNTCBQcmVmb3Jt
YXR0ZWQgQ2hhciI7DQoJbXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCW1zby1zdHlsZS1saW5rOiJI
VE1MIFByZWZvcm1hdHRlZCI7DQoJZm9udC1mYW1pbHk6Q29uc29sYXM7fQ0Kc3Bhbi5FbWFpbFN0
eWxlMjANCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0K
CXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fu
cy1zZXJpZjt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFy
Z2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpX
b3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNo
YXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+DQo8L3htbD48IVtlbmRp
Zl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0
Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9vOnNoYXBlbGF5b3V0Pjwv
eG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9ImJsdWUi
IHZsaW5rPSJwdXJwbGUiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPlRoZSBjb25kaXRpb24gaW4gd2hpY2ggaXTigJlzIGVuYWJsZWQgaXMgaGlkZGVu
IGZyb20gdXBzdHJlYW0uPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpw
PiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPkZyb206PC9iPiBCcmFu
ZG9uIFdyaWdodCAmbHQ7YmVhcm9zb0BnbWFpbC5jb20mZ3Q7IDxicj4NCjxiPlNlbnQ6PC9iPiBT
YXR1cmRheSwgQXVndXN0IDgsIDIwMjAgMTA6MTEgUE08YnI+DQo8Yj5Ubzo8L2I+IEJyb2wsIEVy
eWsgJmx0O0VyeWsuQnJvbEBhbWQuY29tJmd0OzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IFdvb2QsIFd5YXR0ICZsdDtXeWF0dC5Xb29kQGFtZC5jb20mZ3Q7PGJyPg0KPGI+U3ViamVj
dDo8L2I+IFJlOiBbUEFUQ0ggMTIvMTVdIGRybS9hbWQvZGlzcGxheTogVXNlIGh3IGxvY2sgbWdy
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwv
cD4NCjxkaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SnVzdCBjdXJpb3VzLCBidXQg
SSBub3RpY2VkIHRoaXMgbmV3IGxvY2sgbWFuYWdlciBpc24ndCBiZWluZyB1c2VkIGJlY2F1c2Ug
b2YgdGhlIGRlZmluaXRpdmUgZmFsc2UgcmV0dXJuIHZhbHVlIGluJm5ic3A7ZGlzcGxheS9kYy9k
Y2UvZG11Yl9od19sb2NrX21nci5jOjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuMHB0O2NvbG9y
OmJsYWNrIj5zaG91bGRfdXNlX2RtdWJfbG9jay48L3NwYW4+PG86cD48L286cD48L3A+DQo8L2Rp
dj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5XYXMgdGhpcyBzdXBwb3NlZCB0byBiZSBl
bmFibGVkPzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHN0eWxlPSJib3Jk
ZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0NDIDEuMHB0O3BhZGRpbmc6MGluIDBpbiAw
aW4gNi4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2luLXJpZ2h0OjBpbiI+DQo8cHJlIHN0eWxl
PSJ3aGl0ZS1zcGFjZTpwcmUtd3JhcCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9u
dC1mYW1pbHk6Q291cmllcjtjb2xvcjpibGFjayI+RnJvbTogV3lhdHQgV29vZCAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOnd5YXR0LncuLi5AYW1kLmNvbSI+d3lhdHQudy4uLkBhbWQuY29tPC9hPiZndDs8
bzpwPjwvbzpwPjwvc3Bhbj48L3ByZT4NCjxwcmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41
cHQ7Zm9udC1mYW1pbHk6Q291cmllcjtjb2xvcjpibGFjayI+PG86cD4mbmJzcDs8L286cD48L3Nw
YW4+PC9wcmU+DQo8cHJlPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5
OkNvdXJpZXI7Y29sb3I6YmxhY2siPltXaHldPG86cD48L286cD48L3NwYW4+PC9wcmU+DQo8cHJl
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OkNvdXJpZXI7Y29sb3I6
YmxhY2siPkZlYXR1cmUgcmVxdWlyZXMgc3luY2hyb25pemF0aW9uIG9mIGRpZywgcGlwZSwgYW5k
IGN1cnNvciBsb2NraW5nPG86cD48L286cD48L3NwYW4+PC9wcmU+DQo8cHJlPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OkNvdXJpZXI7Y29sb3I6YmxhY2siPmJldHdl
ZW4gZHJpdmVyIGFuZCBmdy48bzpwPjwvbzpwPjwvc3Bhbj48L3ByZT4NCjxwcmUgc3R5bGU9Indo
aXRlLXNwYWNlOnByZS13cmFwIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZh
bWlseTpDb3VyaWVyO2NvbG9yOmJsYWNrIj5bSG93XTxvOnA+PC9vOnA+PC9zcGFuPjwvcHJlPg0K
PHByZT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZhbWlseTpDb3VyaWVyO2Nv
bG9yOmJsYWNrIj5TZXQgZmxhZyB0byBmb3JjZSBwc3IgdG8gdXNlIGh3IGxvY2sgbWdyLjxvOnA+
PC9vOnA+PC9zcGFuPjwvcHJlPg0KPHByZT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtm
b250LWZhbWlseTpDb3VyaWVyO2NvbG9yOmJsYWNrIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48
L3ByZT4NCjxwcmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6Q291
cmllcjtjb2xvcjpibGFjayI+U2lnbmVkLW9mZi1ieTogV3lhdHQgV29vZCAmbHQ7PGEgaHJlZj0i
bWFpbHRvOnd5YXR0LncuLi5AYW1kLmNvbSI+d3lhdHQudy4uLkBhbWQuY29tPC9hPiZndDs8bzpw
PjwvbzpwPjwvc3Bhbj48L3ByZT4NCjxwcmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7
Zm9udC1mYW1pbHk6Q291cmllcjtjb2xvcjpibGFjayI+UmV2aWV3ZWQtYnk6IEFudGhvbnkgS29v
ICZsdDs8YSBocmVmPSJtYWlsdG86YW50aG9ueS4uLi5AYW1kLmNvbSI+YW50aG9ueS4uLi5AYW1k
LmNvbTwvYT4mZ3Q7PG86cD48L286cD48L3NwYW4+PC9wcmU+DQo8cHJlPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OkNvdXJpZXI7Y29sb3I6YmxhY2siPkFja2VkLWJ5
OiBFcnlrIEJyb2wgJmx0OzxhIGhyZWY9Im1haWx0bzplcnlrLmIuLi5AYW1kLmNvbSI+ZXJ5ay5i
Li4uQGFtZC5jb208L2E+Jmd0OzxvOnA+PC9vOnA+PC9zcGFuPjwvcHJlPg0KPHByZT48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZhbWlseTpDb3VyaWVyO2NvbG9yOmJsYWNrIj4t
LS08bzpwPjwvbzpwPjwvc3Bhbj48L3ByZT4NCjxwcmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MC41cHQ7Zm9udC1mYW1pbHk6Q291cmllcjtjb2xvcjpibGFjayI+IGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZG11Yl9wc3IuYyB8IDIgKy08bzpwPjwvbzpwPjwvc3Bhbj48L3By
ZT4NCjxwcmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6Q291cmll
cjtjb2xvcjpibGFjayI+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKTxvOnA+PC9vOnA+PC9zcGFuPjwvcHJlPg0KPHByZT48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjEwLjVwdDtmb250LWZhbWlseTpDb3VyaWVyO2NvbG9yOmJsYWNrIj48bzpwPiZuYnNwOzwvbzpw
Pjwvc3Bhbj48L3ByZT4NCjxwcmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1m
YW1pbHk6Q291cmllcjtjb2xvcjpibGFjayI+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZG11Yl9wc3IuYyA8bzpwPjwvbzpwPjwvc3Bhbj48L3ByZT4NCjxw
cmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6Q291cmllcjtjb2xv
cjpibGFjayI+Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RtdWJfcHNyLmM8
bzpwPjwvbzpwPjwvc3Bhbj48L3ByZT4NCjxwcmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41
cHQ7Zm9udC1mYW1pbHk6Q291cmllcjtjb2xvcjpibGFjayI+aW5kZXggODJlNjdiZDgxZjJkLi41
MTY3ZDZiOGE0OGQgMTAwNjQ0PG86cD48L286cD48L3NwYW4+PC9wcmU+DQo8cHJlPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OkNvdXJpZXI7Y29sb3I6YmxhY2siPi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZG11Yl9wc3IuYzxvOnA+PC9v
OnA+PC9zcGFuPjwvcHJlPg0KPHByZT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250
LWZhbWlseTpDb3VyaWVyO2NvbG9yOmJsYWNrIj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlL2RtdWJfcHNyLmM8bzpwPjwvbzpwPjwvc3Bhbj48L3ByZT4NCjxwcmU+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6Q291cmllcjtjb2xvcjpibGFj
ayI+QEAgLTIzMyw4ICsyMzMsOCBAQCBzdGF0aWMgYm9vbCBkbXViX3Bzcl9jb3B5X3NldHRpbmdz
KHN0cnVjdCBkbXViX3BzciAqZG11Yiw8bzpwPjwvbzpwPjwvc3Bhbj48L3ByZT4NCjxwcmU+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6Q291cmllcjtjb2xvcjpibGFj
ayI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNvcHlfc2V0dGlu
Z3NfZGF0YS0mZ3Q7ZnJhbWVfY2FwX2luZCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA9IDxvOnA+PC9vOnA+
PC9zcGFuPjwvcHJlPg0KPHByZT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZh
bWlseTpDb3VyaWVyO2NvbG9yOmJsYWNrIj5wc3JfY29udGV4dC0mZ3Q7cHNyRnJhbWVDYXB0dXJl
SW5kaWNhdGlvblJlcTs8bzpwPjwvbzpwPjwvc3Bhbj48L3ByZT4NCjxwcmU+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6Q291cmllcjtjb2xvcjpibGFjayI+Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNvcHlfc2V0dGluZ3NfZGF0YS0m
Z3Q7ZGVidWcuYml0ZmllbGRzLnZpc3VhbF9jb25maXJtJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7ID0gPG86cD48L286cD48L3NwYW4+PC9wcmU+DQo8cHJlPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OkNvdXJpZXI7Y29sb3I6YmxhY2siPmRjLSZndDtkYy0m
Z3Q7ZGVidWcudmlzdWFsX2NvbmZpcm0gPT0gVklTVUFMX0NPTkZJUk1fUFNSID88bzpwPjwvbzpw
Pjwvc3Bhbj48L3ByZT4NCjxwcmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1m
YW1pbHk6Q291cmllcjtjb2xvcjpibGFjayI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHRy
dWUgOiA8bzpwPjwvbzpwPjwvc3Bhbj48L3ByZT4NCjxwcmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMC41cHQ7Zm9udC1mYW1pbHk6Q291cmllcjtjb2xvcjpibGFjayI+ZmFsc2U7PG86cD48L286
cD48L3NwYW4+PC9wcmU+DQo8cHJlPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQt
ZmFtaWx5OkNvdXJpZXI7Y29sb3I6YmxhY2siPismbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgY29weV9zZXR0aW5nc19kYXRhLSZndDtkZWJ1Zy5iaXRmaWVsZHMudXNlX2h3X2xv
Y2tfbWdyJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ID0gMTs8bzpwPjwvbzpwPjwvc3Bhbj48L3By
ZT4NCjxwcmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6Q291cmll
cjtjb2xvcjpibGFjayI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IGNvcHlfc2V0dGluZ3NfZGF0YS0mZ3Q7aW5pdF9zZHBfZGVhZGxpbmUmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPSA8bzpwPjwvbzpwPjwvc3Bhbj48
L3ByZT4NCjxwcmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6Q291
cmllcjtjb2xvcjpibGFjayI+cHNyX2NvbnRleHQtJmd0O3NkcFRyYW5zbWl0TGluZU51bURlYWRs
aW5lOzxvOnA+PC9vOnA+PC9zcGFuPjwvcHJlPg0KPHByZT48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjEwLjVwdDtmb250LWZhbWlseTpDb3VyaWVyO2NvbG9yOmJsYWNrIj4tJm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNvcHlfc2V0dGluZ3NfZGF0YS0mZ3Q7ZGVidWcuYml0Zmll
bGRzLnVzZV9od19sb2NrX21nciZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA9IDA7PG86cD48L286
cD48L3NwYW4+PC9wcmU+DQo8cHJlPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQt
ZmFtaWx5OkNvdXJpZXI7Y29sb3I6YmxhY2siPiA8bzpwPjwvbzpwPjwvc3Bhbj48L3ByZT4NCjxw
cmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6Q291cmllcjtjb2xv
cjpibGFjayI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
ZGNfZG11Yl9zcnZfY21kX3F1ZXVlKGRjLSZndDtkbXViX3NydiwgJmFtcDtjbWQpOzxvOnA+PC9v
OnA+PC9zcGFuPjwvcHJlPg0KPHByZT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250
LWZhbWlseTpDb3VyaWVyO2NvbG9yOmJsYWNrIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgZGNfZG11Yl9zcnZfY21kX2V4ZWN1dGUoZGMtJmd0O2RtdWJfc3J2KTs8
bzpwPjwvbzpwPjwvc3Bhbj48L3ByZT4NCjxwcmU+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41
cHQ7Zm9udC1mYW1pbHk6Q291cmllcjtjb2xvcjpibGFjayI+LS0gPG86cD48L286cD48L3NwYW4+
PC9wcmU+DQo8cHJlPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OkNv
dXJpZXI7Y29sb3I6YmxhY2siPjIuMjUuMTxvOnA+PC9vOnA+PC9zcGFuPjwvcHJlPg0KPC9ibG9j
a3F1b3RlPg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_DM5PR12MB250472246E00FEA8E5D6950D8F440DM5PR12MB2504namp_--

--===============1787222845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1787222845==--
