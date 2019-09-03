Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1227A63BE
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 10:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBBD897B5;
	Tue,  3 Sep 2019 08:21:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4a::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3199897B5
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 08:21:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5PNNfp0wVufGCKC54FI580MeNuYViQKuqPNDDHC7uUELscKrLhK7wx5bBVYWfi6ruFdBbn69AClVQGp1lyOCOtcwnPClMBKrcEgea7xxpHAwp65XjFJq0n+WOSUvslaj7C3lngeTmyPTMa2bWOe24eIbw2PwGWyqzuPeK6DfFzDHIqRjRHozbxLeuHEyOFD2pCYBp0TRpCd9z7LQhmYwzLERw+mDv3Ooz02B0eYB9V3mfY/PmSzJPiMKNfqpUwk4+FnF2+9Gwoa6kVVl4EonDMMhyaaYz8Q/4y/LCjRn9AZwOK0MR93XEkzA3/yEgkrbpPv1FRe91Lw1f2n/kGjhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WH2dhUHF8WfE2Je2fqcg25FThNM73m78BaQku9zNDw=;
 b=kjK2VB5eOfrHSVOhpZPO9o0GzJFfj6lHDL0TQpCiqoFeiDzl5GSHlec2jnBEQHRxovwpfRA60v10EsglrnF/sXYfXPNDRy4yXy0WL2NFl9mKUog4alRA6lyp3n67JHx7sVIjtFJm1cPFjc6SgluKEwg5hc3QoDqmrLahAbXX6v5XBzk7GoFI1495pE+vXyEmCvOAajRzHtFA0TcvIFu52G7agCFXx7IlbQOyz8B/R4onoQsTAB/u2uAaplPjPEM+t9gm8H0IKFBJzeUU1Kck8TDBXZDCG75HwsVRJnEZWESx9vrnXRmQNMTrQBapcsPL+pyVGtwLeQ1Cw+4CHYCg4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1497.namprd12.prod.outlook.com (10.172.38.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.22; Tue, 3 Sep 2019 08:21:53 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 08:21:53 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: 78666679 <78666679@qq.com>, amd-gfx <amd-gfx@lists.freedesktop.org>
Subject: Re: Bug: amdgpu drm driver cause process into Disk sleep state
Thread-Topic: Bug: amdgpu drm driver cause process into Disk sleep state
Thread-Index: AQHVYior7LFqNiJ5HU6M6kt7SCAvu6cZnOyA
Date: Tue, 3 Sep 2019 08:21:53 +0000
Message-ID: <f761fec0-c0cc-426c-6bcb-c3fd23808888@amd.com>
References: <tencent_4DEABBEB3BB4C6A6D84CA9F0DB225FBF5809@qq.com>
In-Reply-To: <tencent_4DEABBEB3BB4C6A6D84CA9F0DB225FBF5809@qq.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0161.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::29) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6825ab1-9ab7-4c76-8e01-08d73047c6ca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1497; 
x-ms-traffictypediagnostic: DM5PR12MB1497:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1497D7A7BAAFB5D3DB5856DA83B90@DM5PR12MB1497.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(189003)(199004)(11346002)(5660300002)(386003)(6506007)(52116002)(2906002)(110136005)(31686004)(486006)(2616005)(25786009)(102836004)(65806001)(76176011)(36756003)(6116002)(446003)(65956001)(316002)(476003)(58126008)(99286004)(186003)(53936002)(7736002)(6246003)(14454004)(66556008)(66476007)(478600001)(66446008)(66946007)(46003)(6306002)(6512007)(6436002)(229853002)(256004)(14444005)(71190400001)(71200400001)(86362001)(31696002)(8676002)(8936002)(4326008)(305945005)(64756008)(6486002)(966005)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1497;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 26jrk5Q55TnjqCDCfg7YwxazFnOm++E++OjKEVF6//MHIMUivcd1457VyZo9yUTIL1skkmC2P5UnXiiYfirwRYAzjWYEycOMxeIE8HNcEsZV/EGO4iUI6Nu1u/EFGJVHzwzT+hXv+MUjlZlGvi/F7m3KjqHvPoX4JLsl9c1igGa/QKw9BBBKBPqGlMuOX0IhZSBnXAFjguasucPKRnvrkuD5uU4CcH3lIIx0y1iD9LspPcAgt+Ky1atc6TOxWrx9TBBZZTRetc7agIck3tQsK9OasLpaw10qmOBwcazVKX5dV+eiJEMouAAIOargi0/c6aK/l7QWqkK2SZazdEYBFwuvb+EeKq2ixFmTOZXpIdrwW+2Mpx8hTD419PG1McqO2RxnIogtrvTX3q46xP9+Cykl4i6G9Q/iH70uFDWuEow=
Content-ID: <250332FD32B135408B8B9FB69BEA2DA9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6825ab1-9ab7-4c76-8e01-08d73047c6ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 08:21:53.4358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q9iRKYnJ3PvW758lpGjAi7q01/b9Xs7d6tXEtgdNHAyTaxzDMaq9WEJZeNHdgH6w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1497
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WH2dhUHF8WfE2Je2fqcg25FThNM73m78BaQku9zNDw=;
 b=rTtZe76nlVFGjWFHOSO1IfyFPPZJ9mw4PA9GURLfZaaQ2TahJbps3SZj8cx+vVZsvld6r/k6Uj+ybFZXAaYg5fn6bVvJhhT90euQleGRvyZH1wvy5wcYcdkMvB+NGpnAw9DAmDRNSOCxAiLbxN8d8c0LYjMh4a2w5BJ48or6x/E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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

SGkgWWFuaHVhLAoKcGxlYXNlIHVwZGF0ZSB5b3VyIGtlcm5lbCBmaXJzdCwgY2F1c2UgdGhhdCBs
b29rcyBsaWtlIGEga25vd24gaXNzdWUgCndoaWNoIHdhcyByZWNlbnRseSBmaXhlZCBieSBwYXRj
aCAiZHJtL3NjaGVkdWxlcjogdXNlIGpvYiBjb3VudCBpbnN0ZWFkIApvZiBwZWVrIi4KClByb2Jh
Ymx5IGJlc3QgdG8gdHJ5IHRoZSBsYXRlc3QgYmxlZWRpbmcgZWRnZSBrZXJuZWwgYW5kIGlmIHRo
YXQgZG9lc24ndCAKaGVscCBwbGVhc2Ugb3BlbiB1cCBhIGJ1ZyByZXBvcnQgb24gaHR0cHM6Ly9i
dWdzLmZyZWVkZXNrdG9wLm9yZy8uCgpSZWdhcmRzLApDaHJpc3RpYW4uCgpBbSAwMy4wOS4xOSB1
bSAwOTozNSBzY2hyaWViIDc4NjY2Njc5Ogo+IEhpLCBTaXJzOgo+ICAgICAgICAgSSBoYXZlIGEg
d3g1MTAwIGFtZGdwdSBjYXJkLCBJdCByYW5kb21seSBjb21lIGludG8gZmFpbHVyZS4gIHNvbWV0
aW1lcywgaXQgd2lsbCBjYXVzZSBwcm9jZXNzZXMgaW50byB1bmludGVycnVwdGlibGUgd2FpdCBz
dGF0ZS4KPgo+Cj4gY3BzLW5ldy1vbmRlbWFuZC0wNTg3On4gIyBwcyBhdXh8Z3JlcCAtdyBECj4g
cm9vdCAgICAgIDExMjY4ICAwLjAgIDAuMCAyNjA2MjggIDM1MTYgPyAgICAgICAgU3NsICA45pyI
MjYgICAwOjAwIC91c3Ivc2Jpbi9nc3Nwcm94eSAtRAo+IHJvb3QgICAgIDEzNjQ4MiAgMC4wICAw
LjAgMjEyNTAwICAgNTcyIHB0cy8wICAgIFMrICAgMTU6MjUgICAwOjAwIGdyZXAgLS1jb2xvcj1h
dXRvIC13IEQKPiByb290ICAgICAzNzA2ODQgIDAuMCAgMC4wICAxNzk3MiAgNzQyOCA/ICAgICAg
ICBTcyAgIDnmnIgwMiAgIDA6MDQgL3Vzci9zYmluL3NzaGQgLUQKPiAxMDA2NiAgICA0MzI5NTEg
IDAuMCAgMC4wICAgICAgMCAgICAgMCA/ICAgICAgICBEICAgIDnmnIgwMiAgIDA6MDAgW0Zha2VG
aW5hbGl6ZXJEYV0KPiByb290ICAgICA0OTY3NzQgIDAuMCAgMC4wICAgICAgMCAgICAgMCA/ICAg
ICAgICBEICAgIDnmnIgwMiAgIDA6MTcgW2t3b3JrZXIvODoxK2V2ZV0KPiBjcHMtbmV3LW9uZGVt
YW5kLTA1ODc6fiAjIGNhdCAvcHJvYy80OTY3NzQvc3RhY2sKPiBbPDA+XSBfX3N3aXRjaF90bysw
eDk0LzB4ZTgKPiBbPDA+XSBkcm1fc2NoZWRfZW50aXR5X2ZsdXNoKzB4ZjgvMHgyNDggW2dwdV9z
Y2hlZF0KPiBbPDA+XSBhbWRncHVfY3R4X21ncl9lbnRpdHlfZmx1c2grMHhhYy8weDE0OCBbYW1k
Z3B1XQo+IFs8MD5dIGFtZGdwdV9mbHVzaCsweDJjLzB4NTAgW2FtZGdwdV0KPiBbPDA+XSBmaWxw
X2Nsb3NlKzB4NDAvMHhhMAo+IFs8MD5dIHB1dF9maWxlc19zdHJ1Y3QrMHgxMTgvMHgxMjAKPiBb
PDA+XSBwdXRfZmlsZXNfc3RydWN0KzB4MzAvMHg2OCBbYmluZGVyX2xpbnV4XQo+IFs8MD5dIGJp
bmRlcl9kZWZlcnJlZF9mdW5jKzB4NGQ0LzB4NjU4IFtiaW5kZXJfbGludXhdCj4gWzwwPl0gcHJv
Y2Vzc19vbmVfd29yaysweDFiNC8weDNmOAo+IFs8MD5dIHdvcmtlcl90aHJlYWQrMHg1NC8weDQ3
MAo+IFs8MD5dIGt0aHJlYWQrMHgxMzQvMHgxMzgKPiBbPDA+XSByZXRfZnJvbV9mb3JrKzB4MTAv
MHgxOAo+IFs8MD5dIDB4ZmZmZmZmZmZmZmZmZmZmZgo+Cj4KPgo+IFRoaXMgaXNzdWUgdHJvdWJs
ZWQgbWUgYSBsb25nIHRpbWUuICBsb29raW5nIGVhZ2VybHkgdG8gZ2V0IGhlbHAgZnJvbSB5b3Uh
Cj4KPgo+IC0tLS0tCj4gWWFuaHVhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
